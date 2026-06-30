---
title : "Deploy Beanstalk Backend & Worker"
date : 2024-01-01
weight : 2
chapter : false
pre : " <b> 5.5.2. </b> "
---

### Deploy Elastic Beanstalk Environments

In this section, we will deploy the API Backend server and the Worker server using **AWS Elastic Beanstalk**, and configure environment properties.

---

#### 1. Deploy Beanstalk Backend (Web Server Environment)

1. Open the [AWS Elastic Beanstalk console](https://us-east-1.console.aws.amazon.com/elasticbeanstalk/home?region=us-east-1#/applications).
2. Click **Create application**.
3. Initial configuration:
   * **Application name**: Enter ```ticket-app-App```.
   * **Platform**: Select **Node.js**.
   * **Platform branch**: Select **Node.js 20 running on 64bit Amazon Linux 2023**.
   * **Application code**: Select **Sample application**.
   * Click **Next**.

![EB Platform](/images/5-Workshop/5.5-Application-Messaging/eb_platform.png)

4. Configure **Service Access**:
   * **Service role**: Select **Use an existing service role** or let the system create a new one.
   * **EC2 instance profile**: Select your instance profile role (ensure it has permissions for SQS, RDS, and Secrets Manager).
   * Click **Next**.
5. Configure **Networking**:
   * **VPC**: Select the ```ticket-app-vpc``` VPC.
   * **Instance subnets**: Check the two **Private Subnets**.
   * **Load balancer subnets**: Check the two **Public Subnets**.
   * Click **Next**.
6. Configure **Instances & Auto Scaling**:
   * **Environment type**: Select **Load balanced**.
   * **Instances**: t3.micro.
   * **Auto Scaling Group**: Min: ```2```, Max: ```4```.
   * **Scaling triggers**: Metric: ```CPUUtilization``` (Upper: ```70%```, Lower: ```30%```).
   * Click **Next** -> **Next** -> click **Submit** to initialize.
   * Environment name: ```ticket-app-Backend-env```.

![EB Application and Environment](/images/5-Workshop/5.5-Application-Messaging/beanstalk_environments.png)

---

#### 2. Deploy Beanstalk Worker (Web Server Environment)

{{% notice important %}}
Important Note: The Beanstalk Worker Environment in this project is actually a Node.js process actively polling messages via the AWS SDK. Thus, we deploy it as a **Web server environment** (Load balanced) similar to the Backend, rather than using Beanstalk's specialized Worker Environment.
{{% /notice %}}

1. Go back to the Elastic Beanstalk application ```ticket-app-App``` page.
2. Click **Create new environment** (top right).
3. **Environment tier**: Select **Web server environment**.
4. **Environment name**: Enter ```ticket-app-Worker-env```.
5. Platform should be Node.js 20.
6. Configure **Service Access**, **Networking**, **Instances & Auto Scaling** exactly like the Backend above:
   * **VPC**: ```ticket-app-vpc```.
   * **Instance subnets**: Select the two **Private Subnets**.
   * **Load balancer subnets**: Select the two **Public Subnets**.
7. Click **Submit** to initialize.

---

#### 3. Configure Environment Properties

Configure environment properties directly on the Beanstalk Console:

1. **Configure Backend (```ticket-app-Backend-env```)**:
   * Go to ```ticket-app-Backend-env``` details -> click **Configuration** -> **Updates, monitoring, and logging** -> click **Edit**.
   * Under **Environment properties**, add:
     * ```PORT```: ```8080```
     * ```AWS_REGION```: ```us-east-1```
     * ```DB_HOST```: *(Enter RDS Proxy endpoint)*
     * ```DB_PORT```: ```5432```
     * ```DB_NAME```: ```ticketing_db```
     * ```DB_USER```: ```postgres```
     * ```DB_PASSWORD```: ```TicketingAppPassword2026!```
     * ```REDIS_HOST```: *(Enter Redis Primary endpoint)*
     * ```REDIS_PORT```: ```6379```
     * ```SQS_BOOKING_QUEUE_URL```: ```https://sqs.us-east-1.amazonaws.com/<your-account-id>/booking-queue.fifo```
     * ```COGNITO_USER_POOL_ID```: *(See Chapter 5.7)*
     * ```COGNITO_CLIENT_ID```: *(See Chapter 5.7)*
     * ```CLOUDFRONT_DOMAIN```: ```https://<your-cloudfront-domain>.cloudfront.net```
     * ```MOMO_PARTNER_CODE```: ```MOMO```
     * ```MOMO_ACCESS_KEY```: ```F8BBA842ECF85```
     * ```MOMO_SECRET_KEY```: ```K951B6PE1waDMi640xX08PD3vg6EkVlz```
     * ```MOMO_ENDPOINT```: ```https://test-payment.momo.vn/v2/gateway/api```
     * ```RESERVATION_TIMEOUT_MINUTES```: ```15```
   * Click **Apply**.

![Backend Environment Properties](/images/5-Workshop/5.5-Application-Messaging/backend_properties.png)

2. **Configure Worker (```ticket-app-Worker-env```)**:
   * Perform the same steps for ```ticket-app-Worker-env``` with similar environment properties so that the Worker can connect to the Database, Redis, and read SQS messages.

![Worker Environment Properties](/images/5-Workshop/5.5-Application-Messaging/worker_properties.png)
