---
title : "Test & Validation"
date : 2024-01-01
weight : 9
chapter : false
pre : " <b> 5.9. </b> "
---

### Test & Validation

After the system has been fully deployed via the CI/CD pipeline, the next step is to validate the functionality, load capacity, and fault tolerance of our 3-tier architecture.

In this lab, we will perform end-to-end testing following both the user flow and the system flow.

---

#### 1. Check Metrics & Message Queue (SQS)
**Scenario:** Verify that messages are successfully published to the SQS queue by the Backend API.

*   **Step 1:** Log into the AWS Console and navigate to the **SQS** service.
*   **Step 2:** Select the `booking-queue.fifo` queue.
*   **Step 3:** Switch to the **Monitoring** tab.
*   **Expected Result:** You will see the **Number Of Messages Sent** metric spike corresponding to the number of booking requests. If the Worker is functioning correctly, the **Number Of Messages Deleted** will also increase shortly after (indicating the Worker consumed the messages).
![SQS Metrics 1](/images/5-Workshop/5.9-Test-Validation/sqs_1.png)
![SQS Metrics 2](/images/5-Workshop/5.9-Test-Validation/sqs_2.png)

---

#### 2. View Logs on CloudWatch & Elastic Beanstalk
**Scenario:** Monitor the Worker's process of consuming orders and inserting them into the PostgreSQL database.

*   **Step 1:** Navigate to **CloudWatch** -> **Log groups**.
*   **Step 2:** Find the Log group for the **Beanstalk Worker** environment (typically formatted as `/aws/elasticbeanstalk/ticket-app-Worker-env/var/log/web.stdout.log`).
*   **Step 3:** Search for keywords such as `Processing message` or `Message processed successfully`.
*   **Expected Result:** The logs will display the detailed execution of the worker receiving messages from SQS, processing payment transactions, generating e-tickets, updating the status in RDS PostgreSQL, and sending notification emails via SES.
![CloudWatch Logs 1](/images/5-Workshop/5.9-Test-Validation/cw_log_1.png)
![CloudWatch Logs 2](/images/5-Workshop/5.9-Test-Validation/cw_log_2.png)

---

#### 3. Validate Output (SES / SNS Emails)
**Scenario:** The customer must receive an e-ticket email.

*   **Step 1:** Check the inbox of the email address you used to register the Cognito account.
*   **Expected Result:** A confirmation email from **Amazon SES** containing the e-ticket details and QR code is successfully delivered. There should be no more than a 1-2 minute delay after the booking request.

{{% notice note %}}
**Note:** Because your Amazon SES account is in **Sandbox mode**, you can only send emails to verified addresses. Ensure that the recipient email address (the one used for Cognito registration) is also added and verified in the SES "Verified identities" section.
{{% /notice %}}

![SES Email 1](/images/5-Workshop/5.9-Test-Validation/ses_1.png)
![SES Email 2](/images/5-Workshop/5.9-Test-Validation/ses_2.png)
![SES Email 3](/images/5-Workshop/5.9-Test-Validation/ses_3.png)

---

#### 4. Fault Testing (Chaos / Fault Tolerance)
**Scenario:** Simulate a database connection failure or worker shutdown to verify that the system does not lose any orders.

*   **Step 1:** Intentionally alter the RDS password in Secrets Manager to be incorrect, OR scale the Beanstalk Worker capacity down to 0 to terminate all workers.
*   **Step 2:** Return to the Frontend interface and continuously submit ticket bookings.
*   **Step 3:** Check SQS.
*   **Step 4:** Check CloudWatch Alarms. After a while, you will see the DLQ Alarm (e.g., `ticket-app-checkout-dlq-alarm`) transition to the **In alarm** state due to failed messages landing in the DLQ. Simultaneously, an alert email from **Amazon SNS** will be sent to the administrator's (Ops) inbox.
*   **Expected Result:** 
    * The API Backend still responds rapidly without crashing.
    * Because the Worker is down or experiencing errors, messages remain in `booking-queue.fifo`.
    * After the maximum number of retries, the booking messages are automatically pushed to the **Dead Letter Queue (checkout-dlq.fifo)** and trigger the CloudWatch Alarm (as shown below).
    * Once the issue is resolved (Worker restarted), administrators can use the *Redrive* feature in the DLQ to move messages back to the main queue for processing. **Absolutely no orders are lost.**

![DLQ Alarm](/images/5-Workshop/5.9-Test-Validation/dlq_1.png)
![DLQ Email Alert](/images/5-Workshop/5.9-Test-Validation/dlq_2.jpg)

Congratulations! You have successfully tested and proven the resilience of a Decoupled Architecture on AWS. Proceed to the next section to clean up the resources.
