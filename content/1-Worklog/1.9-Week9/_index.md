---
title: "Week 9 Worklog"
date: 2024-01-01
weight: 9
chapter: false
pre: " <b> 1.9. </b> "
---
### Week 9 Objectives:

* Brainstorm and comprehensively design the **cloud infrastructure Architecture Diagram** for the **Flash Sale** ticket booking system.
* Plan secure **VPC** networking and detail the **Amazon SQS**, **SNS** integration flow on the architecture blueprint.
* Analyze technical trade-offs and finalize the design approach.

### Tasks to be carried out this week:
| Day | Task                                                                                                                                                                                                   | Start Date | Completion Date | Reference Material                        |
| --- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------- | --------------- | ----------------------------------------- |
| 2   | - Brainstorm and comprehensively design the **Architecture Diagram** for the **Flash Sale** ticket booking system <br> - Identify key components: **EC2**, **RDS**, **S3**, **SQS**, **SNS**, **CloudFront** | 06/15/2026 | 06/15/2026      |                                           |
| 3   | - Plan secure **VPC** networking: design **Public/Private Subnet**, **Security Group**, **NAT Gateway** <br> - Detail the **Amazon SQS** integration flow on the architecture blueprint                   | 06/16/2026 | 06/16/2026      |                                           |
| 4   | - Detail the **Amazon SNS** integration flow on the architecture blueprint for asynchronous processing <br> - Complete the flow: client → API → SQS → worker → SNS → customer notification               | 06/17/2026 | 06/17/2026      |                                           |
| 5   | - Analyze technical trade-offs: **EC2 + Auto Scaling** vs **AWS Lambda** <br> - Evaluate cold start, execution time limits, cost, controllability                                                     | 06/18/2026 | 06/18/2026      |                                           |
| 6   | - Finalize design approach: use **EC2** servers combined with **Auto Scaling** instead of AWS Lambda <br> - Ensure continuous performance for the Flash Sale system                                        | 06/19/2026 | 06/19/2026      |                                           |


### Week 9 Achievements:

This week I focused entirely on **architecture design** — brainstorming and comprehensively drawing the **Architecture Diagram** for the **Flash Sale** ticket booking system. Unlike previous weeks that were mainly coding and hands-on, this week was about the big picture: which services go where, how the data flow works.

The most important part was planning secure **VPC** networking (Public/Private Subnet, Security Group, NAT Gateway) and detailing the **Amazon SQS** + **SNS** integration flow on the blueprint: client → API → SQS queue → asynchronous worker processing → SNS sends notifications to customers. Looking at the diagram makes it clearer how services connect to each other.

The area I analyzed the longest was the technical trade-off between **EC2 + Auto Scaling** and **AWS Lambda**. Lambda is lightweight, auto-scales, but cold start and execution time limit (15 minutes) are not suitable for a Flash Sale system that needs continuous, stable processing. In the end, I chose **EC2 combined with Auto Scaling** — ensuring continuous performance while automatically scaling up when traffic spikes suddenly.


