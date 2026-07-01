---
title: "Week 8 Worklog"
date: 2024-01-01
weight: 8
chapter: false
pre: " <b> 1.8. </b> "
---
### Week 8 Objectives:

* Research **event-driven architecture** and design asynchronous processing flow using **Amazon SQS**, **SNS**.
* Practice configuring SNS Topic and SQS Queue directly on AWS Console.

### Tasks to be carried out this week:
| Day | Task                                                                                                                                                                                                   | Start Date | Completion Date | Reference Material                        |
| --- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------- | --------------- | ----------------------------------------- |
| 2   | - Research **Event-Driven Architecture** on AWS <br> - Understand why asynchronous processing is needed, common patterns                                                                                 | 06/08/2026 | 06/08/2026      |                                           |
| 3   | - Design asynchronous processing flow using **Amazon SQS** and **SNS** for the ticket booking project <br> - Study SQS (Standard vs FIFO) and SNS (topics, subscriptions)                               | 06/09/2026 | 06/09/2026      |                                           |
| 4   | - Integrate **SQS** as payment request processing queue <br> - Configure **SNS** to send confirmation emails/messages and e-tickets to customers                                                         | 06/10/2026 | 06/10/2026      |                                           |
| 5   | - Write test scripts for asynchronous processing flow <br> - Handle errors encountered during message transmission via SQS/SNS                                                                          | 06/11/2026 | 06/11/2026      |                                           |
| 6   | - Review integrated SQS + SNS architecture <br> - Write test scripts to verify asynchronous processing flows                                                                                                                       | 06/12/2026 | 06/12/2026      |                                           |
| 7   | - Practice configuring **SNS Topic** and **SQS Queue** directly on AWS Console <br> - Run tests for sending messages and receiving notifications | 06/13/2026 | 06/13/2026      |                                           |


### Week 8 Achievements:

This week I combined technical work with valuable career orientation learning. On the technical side: researched **event-driven architecture** and designed asynchronous processing flow using **Amazon SQS** + **SNS** for the ticket booking project — when many people book simultaneously, payment requests are pushed to **SQS queue** for workers to process, then **SNS** sends confirmation emails + e-tickets to customers.

The biggest highlight of the week was successfully configuring the **SQS** and **SNS** systems on the AWS Console. Practical configuration helped me better understand message passing mechanisms, as well as how to set up a Dead Letter Queue (DLQ) to ensure no data is lost when errors occur during ticket payment processing.
