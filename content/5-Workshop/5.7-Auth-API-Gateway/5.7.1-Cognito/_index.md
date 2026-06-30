---
title : "Cognito User Pool"
date : 2024-01-01
weight : 1
chapter : false
pre : " <b> 5.7.1. </b> "
---

### Identity Management with Amazon Cognito

Cognito manages user registration, logins, and issues JWT Access Tokens for the Client.

---

#### Step-by-Step Instructions:

1. Open the [Amazon Cognito console](https://us-east-1.console.aws.amazon.com/cognito/v2/home?region=us-east-1#).
2. Click **Create user pool**.
3. Step-by-step configuration:
   * **Configure sign-in experience**: Select **Email** -> click **Next**.
   * **Configure security requirements**: Select **No MFA** -> click **Next**.
   * **Configure sign-up experience**: Keep defaults -> click **Next**.
   * **Configure message delivery**: Select **Send email with Cognito** -> click **Next**.
   * **Integrate your app**:
     * **User pool name**: Enter ```ticket-app-user-pool```.
     * **Initial app client**: Select **Public client** -> App client name: ```ticketing-booking```.
     * **Client secret**: Select **Don't generate a client secret** (Required for React/NextJS frontend applications running directly in the browser).
4. Click **Next** -> Click **Create user pool**.

![Cognito User Pool created](/images/5-Workshop/5.7-Auth-API-Gateway/cognito_userpool.png)

5. Copy the **User Pool ID** (e.g. `us-east-1_xxxxx`) and the **App Client ID** to configure the API Gateway and Web Frontend.
