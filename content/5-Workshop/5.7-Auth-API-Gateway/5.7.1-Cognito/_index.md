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
2. Select **User pools** -> Click **Create user pool**.
3. Under **Define your application**:
   * **Application type**: Select **Single-page application (SPA)** *(This application type does NOT generate a Client Secret by default, which is required for our React SPA architecture)*.
4. Under **Name your application**:
   * Enter application name: ```ticket-app-user-pool```.
5. Under **Configure options**, configure the basic settings:
   * **Sign-in identifiers**: Select **Email**.
   * **Required attributes**: Keep defaults.
   * **Authentication options**: Select **No MFA**.
   * **Password policy**: Keep defaults.
   * **Self-service sign-up**: Keep defaults (Enable self-registration).
6. Click **Create user pool**. (Cognito will automatically create the User Pool and a corresponding App Client).

   ![Cognito User Pool created](/images/5-Workshop/5.7-Auth-API-Gateway/cognito_userpool.png)

7. From the created User Pool's detail page, copy the following 2 parameters to configure API Gateway and Frontend in the next chapter:
   * **User Pool ID** (displayed on the overview page).
   * **App Client ID** (switch to the *App clients* section and copy the Client ID).

*(Note: If you need to change Cognito email delivery settings or other advanced features, you can edit the Authentication, Sign-up, Message templates, etc., sections after the User Pool has been created).*
