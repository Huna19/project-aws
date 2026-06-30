---
title : "Application & Messaging Tier"
date : 2024-01-01
weight : 5
chapter : false
pre : " <b> 5.5. </b> "
---

### Application & Messaging Tier

In this chapter, we will configure the **Amazon SQS FIFO** message queue and the **AWS Elastic Beanstalk** Node.js application environments to run the API Backend and process ticket booking tasks asynchronously.

#### Implementation Steps:

1. **[Configure Queues (SQS FIFO & DLQ)](5.5.1-queue/)**
   * Create the main queue `booking-queue.fifo` to receive ticket booking requests.
   * Create a Dead Letter Queue (DLQ) `checkout-dlq.fifo` to hold messages that have exceeded the maximum processing attempts.

2. **[Deploy Beanstalk (Backend API & Worker)](5.5.2-beanstalk/)**
   * Deploy the Web API server `ticket-app-Backend-env` in Private Subnets behind a Load Balancer.
   * Deploy the Worker server `ticket-app-Worker-env` to process the queue.
   * Configure Environment properties for the Beanstalk environments.

3. **[SNS Notifications & DLQ Monitoring](5.5.3-sns/)**
   * Create 2 SNS Topics to send email notifications to the operations team (Ops) and end users.
   * Configure a CloudWatch Alarm to monitor the Dead Letter Queue and alert when ticket bookings fail.
