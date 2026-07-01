---
title: "Week 10 Worklog"
date: 2024-01-01
weight: 10
chapter: false
pre: " <b> 1.10. </b> "
---
### Week 10 Objectives:

* Set up core network infrastructure: VPC, Subnets, NAT Gateways, Security Groups.
* Provision data tier: **RDS PostgreSQL**, **ElastiCache Redis**.
* Set up queue and authentication services: **SQS FIFO**, **Cognito**.

### Tasks to be carried out this week:
| Day | Task | Start Date | Completion Date | Reference Material |
| --- | --- | --- | --- | --- |
| 2 | - Design VPC, segment into Public/Private Subnets across 2 Availability Zones, NAT Gateways, and set up Security Group Chaining | 06/22/2026 | 06/22/2026 | |
| 3 | - Deploy **RDS PostgreSQL Multi-AZ** with **RDS Proxy** and provision **ElastiCache Redis** cluster | 06/23/2026 | 06/23/2026 | |
| 4 | - Configure **Amazon Cognito User Pool** to manage user authentication and login | 06/24/2026 | 06/24/2026 | |
| 5 | - Provision **SQS FIFO Queues** (Booking Queue & Dead Letter Queue - DLQ) to guarantee ticket ordering | 06/25/2026 | 06/25/2026 | |
| 6 | - Test secure connections from the test environment to the Database, Cache, and Queue | 06/26/2026 | 06/26/2026 | |

### Week 10 Achievements:

This week, the Flash Sale ticket booking system deployment officially kicked off (Phase 1).

I completed the secure network infrastructure setup with a custom **VPC**, clearly segmenting Public/Private Subnets across 2 AZs. At the data tier, instead of standard configurations, I deployed **RDS PostgreSQL Multi-AZ** combined with **RDS Proxy** (for better connection pool management under load) and successfully provisioned **ElastiCache Redis**.

Additionally, I set up the **Cognito User Pool** in preparation for the login flow and created the **SQS FIFO queues** (including Booking Queue and DLQ) to handle reservation logic. All connections from the internal test environment to the DB and Cache have been securely verified via Security Groups. The core infrastructure is now fully ready for next week's application deployment!
