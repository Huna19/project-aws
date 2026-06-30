---
title : "API Gateway & Authorizer"
date : 2024-01-01
weight : 2
chapter : false
pre : " <b> 5.7.2. </b> "
---

### API Gateway & JWT Authorizer

We use **Amazon API Gateway** (HTTP API) to secure API endpoints via a **Cognito JWT Authorizer**.

---

#### 1. Initialize API Gateway HTTP API & Configure Integration

1. Open the [Amazon API Gateway console](https://us-east-1.console.aws.amazon.com/apigateway/main/apis?region=us-east-1).
2. Under **HTTP API**, click **Build**:
   * **API name**: Enter ```ticket-app-api```.
   * Click **Next**.
3. In **Configure routes**, click **Next** to skip.
4. In **Define stages**, keep Stage name as ```$default```, turn on **Auto deploy** -> click **Next** -> **Create**.
5. Copy the **Invoke URL** (e.g. `https://xxxxxx.execute-api.us-east-1.amazonaws.com`) to configure Frontend `REACT_APP_API_URL`.
6. Configure **Integration** to connect to Beanstalk Backend Load Balancer:
   * Select **Integrations** -> **Manage integrations** -> click **Create**.
   * **Integration type**: Select **HTTP proxy**.
   * **Integration method**: Select **ANY**.
   * **Target service**: Enter the raw URL of the Beanstalk Application Load Balancer, e.g. `http://ticket-app-backend-ALB-123456789.us-east-1.elb.amazonaws.com` (Do not append `/` or `{proxy}`).
   * Click **Create**.

![Create HTTP Integration](/images/5-Workshop/5.7-Auth-API-Gateway/api_integration.png)

---

#### 2. Create Cognito JWT Authorizer

1. Select **Authorization** -> **Manage authorizers** -> click **Create**.
2. Configure Authorizer:
   * **Authorizer type**: Select **JWT**.
   * **Name**: ```ticket-app-cognito-authorizer```.
   * **Identity source**: Enter ```$request.header.Authorization```.
   * **Issuer URL**: Enter `https://cognito-idp.<AWS::Region>.amazonaws.com/<UserPoolId>` (e.g. `https://cognito-idp.us-east-1.amazonaws.com/us-east-1_xxxxx`).
   * **Audience**: Enter the **App Client ID**.
3. Click **Create**.

![Create JWT Authorizer](/images/5-Workshop/5.7-Auth-API-Gateway/jwt_authorizer.png)

---

#### 3. Configure Routes (Protected vs Public)

1. Select **Routes** -> click **Create**.
2. Create **Public Routes** (accessible without authentication):
   * Route key: ```POST /api/auth/login``` -> click **Create**. Select Route -> **Attach integration** -> Choose Beanstalk ALB. Keep **Authorization: NONE**.
   * Perform the same for other public routes:
     * ```POST /api/auth/register```
     * ```POST /api/auth/refresh```
     * ```GET /health```
     * ```POST /api/payments/momo/ipn``` (MoMo payment notification webhook)
     * ```GET /api/matches```
     * ```GET /api/matches/{matchId}```
3. Create **Protected Route** (authenticated route):
   * Click **Create** -> Route key: ```ANY /api/{proxy+}``` -> click **Create**.
   * Select ```ANY /api/{proxy+}``` -> **Attach integration** -> Choose Beanstalk ALB.
   * Under **Authorization**: click **Edit** -> Choose **ticket-app-cognito-authorizer** -> click **Save**.

![API Gateway Routes List](/images/5-Workshop/5.7-Auth-API-Gateway/api_routes.png)

---

#### 4. Configure CORS (Cross-Origin Resource Sharing)

Since API Gateway blocks preflight `OPTIONS` requests when using JWT Authorizer, you must configure CORS at the HTTP API level so the browser can make valid requests.

1. On the left menu, select **CORS**.
2. Click **Configure**.
3. Fill in the following information:
   * **Access-Control-Allow-Origin**: Enter your CloudFront domain (e.g., `https://dxxxxxxxxxx.cloudfront.net`). Click **Add**.
   * **Access-Control-Allow-Headers**: Enter `content-type` and `authorization`. Click **Add**.
   * **Access-Control-Allow-Methods**: Select `GET`, `POST`, `PUT`, `DELETE`, `OPTIONS`.
   * **Access-Control-Allow-Credentials**: Select **Yes**.
4. Click **Save**.

![API Gateway CORS](/images/5-Workshop/5.7-Auth-API-Gateway/api_cors.png)
