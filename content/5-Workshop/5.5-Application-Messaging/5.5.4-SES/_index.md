---
title : "Email Configuration (SES)"
date : 2024-01-01
weight : 4
chapter : false
pre : " <b> 5.5.4. </b> "
---

### Configure Amazon Simple Email Service (SES)

Our Ticket Booking system automatically sends email notifications to customers upon successful booking (handled by the background Worker). To enable this, you must configure **Amazon SES** to verify your sender email address and generate SMTP credentials.

---

#### 1. Verify Sender Email Address (Email Identity)

1. Open the [Amazon SES console](https://us-east-1.console.aws.amazon.com/ses/home?region=us-east-1).
2. On the left menu, select **Identities** (under Configuration).
3. Click the **Create identity** button.
4. Configure Identity:
   * **Identity type**: Select **Email address**.
   * **Email address**: Enter your real email address (e.g., `your-email@gmail.com`). This will be used as the sender email (`MAIL_FROM`).
5. Click **Create identity**.

{{% notice warning %}}
**Important:** AWS SES will immediately send a verification email titled *Amazon Web Services – Email Address Verification Request* to your inbox. You **must** open that email and click the verification link. Once clicked, the Identity status in SES will change to **Verified**.
{{% /notice %}}

![SES Identity](/images/5-Workshop/5.5-Application-Messaging/ses_identity.png)

---

#### 2. Create SMTP Credentials

For the application (Worker) to call the SES service and send emails, we need to provide it with an SMTP Username and Password.

1. Still in the [Amazon SES console](https://us-east-1.console.aws.amazon.com/ses/home?region=us-east-1), select **SMTP settings** on the left menu.
2. Click the **Create SMTP credentials** button in the middle of the page.
3. This will open a new tab redirecting to the IAM console:
   * **IAM User Name**: You can leave the default or change it to `ticket-app-smtp-user`.
   * Click **Create user**.
4. The next screen will display your **SMTP username** and **SMTP password**.
5. **CRITICAL STEP:** Click **Download Credentials** (to save as CSV) or carefully copy these two parameters to a notepad. You will not be able to view this password again after leaving the screen!
   * These parameters are the `SMTP_USERNAME` and `SMTP_PASSWORD` that you need to enter into the **Environment properties** of the Worker environment on Beanstalk (as instructed in Chapter 5.5.2).

![SES SMTP Credentials](/images/5-Workshop/5.5-Application-Messaging/ses_smtp.png)

{{% notice info %}}
By default, your SES account is in the Sandbox environment, meaning you can only send emails TO addresses that you have also Verified. Therefore, when testing the booking feature, make sure to enter the email you verified in Step 1 (or verify additional emails) to receive the notifications!
{{% /notice %}}
