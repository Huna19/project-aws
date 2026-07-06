---
title: "Week 8 Worklog"
date: 2024-01-01
weight: 8
chapter: false
pre: " <b> 1.8. </b> "
---

### Week 8 Goals:

* Research **Event-Driven Architecture** and design an asynchronous processing flow using **Amazon SQS** + **SNS**.
* Integrate SQS and SNS into the ticket booking project's payment flow.
* Hands-on configuration of SNS Topic and SQS Queue directly on AWS Console.

### Daily breakdown:

| Day | Work performed | Start Date | Completion Date | Reference |
| --- | --- | --- | --- | --- |
| Monday | - Research **Event-Driven Architecture** on AWS <br> - Understand why asynchronous processing is needed and common patterns | 06/08/2026 | 06/08/2026 | |
| Tuesday | - Design the async processing flow using **Amazon SQS** and **SNS** for the ticket booking system <br> - Study SQS Standard vs FIFO and SNS (topics, subscriptions) | 06/09/2026 | 06/09/2026 | |
| Wednesday | - Integrate **SQS** as the payment request processing queue <br> - Configure **SNS** to send confirmation emails and e-tickets to customers | 06/10/2026 | 06/10/2026 | |
| Thursday | - Write test scripts for the async processing flow <br> - Handle errors during message transmission via SQS/SNS <br> - Configure a Dead Letter Queue (DLQ) to ensure no messages are lost | 06/11/2026 | 06/11/2026 | |
| Friday | - Review the full integrated **SQS + SNS** architecture <br> - Write end-to-end test scenarios to validate the async processing flow | 06/12/2026 | 06/12/2026 | |
| Saturday | - Hands-on: Configure **SNS Topic** and **SQS Queue** directly on AWS Console <br> - Run tests: send messages, verify notification delivery | 06/13/2026 | 06/13/2026 | |

### Weekly outcomes:

This week stepped into entirely new territory: **event-driven architecture**. The core idea: when many users book tickets simultaneously, instead of sequential processing that creates bottlenecks, payment requests get pushed into an **SQS queue** for workers to handle separately — then **SNS** delivers confirmation emails and e-tickets to customers.

The clearest realization this week was the difference between **Standard Queue** (faster, allows duplicates) and **FIFO Queue** (ordered, no duplicates) — the right choice depends entirely on the problem. Configuring the **Dead Letter Queue** turned out to be the most important piece: failed messages are captured rather than silently dropped, so they can be reprocessed later.

On Saturday, I configured SQS and SNS directly on the Console and ran the full flow end-to-end — from pushing a message into the queue to receiving the notification. Seeing it work in real life rather than just on a diagram made the architecture click in a way that documentation alone never does.
