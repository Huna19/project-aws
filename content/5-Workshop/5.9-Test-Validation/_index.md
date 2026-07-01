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

#### 1. Send Request & Validate Frontend-Backend Flow
**Scenario:** Simulate a user purchasing an event ticket from the web interface.

*   **Step 1:** Access the **CloudFront** domain (or S3 Website endpoint) that you obtained during the Frontend deployment.
*   **Step 2:** Log in using **Cognito** (Sign up for a new account if necessary, then verify via email).
*   **Step 3:** Click on an available event, select the ticket quantity, and click **"Book Now"**.
*   **Expected Result:** The interface immediately displays a *"Processing"* status (API response < 200ms). The user's browser does not hang waiting for the database transaction.

---

#### 2. Check Metrics & Message Queue (SQS)
**Scenario:** Verify that messages are successfully published to the SQS queue by the Backend API.

*   **Step 1:** Log into the AWS Console and navigate to the **SQS** service.
*   **Step 2:** Select the `booking-queue.fifo` queue.
*   **Step 3:** Switch to the **Monitoring** tab.
*   **Expected Result:** You will see the **Number Of Messages Sent** metric spike corresponding to the number of booking requests. If the Worker is functioning correctly, the **Number Of Messages Deleted** will also increase shortly after (indicating the Worker consumed the messages).

---

#### 3. View Logs on CloudWatch & Elastic Beanstalk
**Scenario:** Monitor the Worker's process of consuming orders and inserting them into the PostgreSQL database.

*   **Step 1:** Navigate to **CloudWatch** -> **Log groups**.
*   **Step 2:** Find the Log group for the **Beanstalk Worker** environment (typically formatted as `/aws/elasticbeanstalk/ticket-app-worker/var/log/nodejs/nodejs.log`).
*   **Step 3:** Search for keywords such as `Order processed successfully` or `Database inserted`.
*   **Expected Result:** The logs will display the detailed execution of the worker fetching messages from SQS, processing inventory logic, saving the ticket to RDS PostgreSQL, and deleting the message from the queue.

---

#### 4. Validate Output (SES / SNS Emails)
**Scenario:** The customer must receive an e-ticket email.

*   **Step 1:** Check the inbox of the email address you used to register the Cognito account.
*   **Expected Result:** A confirmation email from **Amazon SES** containing the e-ticket details and QR code is successfully delivered. There should be no more than a 1-2 minute delay after the booking request.

---

#### 5. Fault Testing (Chaos / Fault Tolerance)
**Scenario:** Simulate a database connection failure or worker shutdown to verify that the system does not lose any orders.

*   **Step 1:** Intentionally alter the RDS password in Secrets Manager to be incorrect, OR scale the Beanstalk Worker capacity down to 0 to terminate all workers.
*   **Step 2:** Return to the Frontend interface and continuously submit ticket bookings.
*   **Step 3:** Monitor the SQS queues.
*   **Expected Result:** 
    * The Backend API continues to respond rapidly with *"Processing"*, without crashing.
    * Because the Worker is failing (cannot connect to DB) or is turned off, messages will accumulate in `booking-queue.fifo`.
    * After the configured retry failures, the order messages will automatically be routed to the **Dead Letter Queue (checkout-dlq.fifo)**.
    * Once the issue is resolved (Worker/DB restored), administrators can use the DLQ *Redrive* feature to push messages back to the main queue for processing. **Absolutely no order data is lost.**

Congratulations! You have successfully tested and proven the resilience of a Decoupled Architecture on AWS. Proceed to the next section to clean up the resources.
