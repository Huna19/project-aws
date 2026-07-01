---
title: "Week 7 Worklog"
date: 2024-01-01
weight: 7
chapter: false
pre: " <b> 1.7. </b> "
---
### Week 7 Objectives:

* Self-study **AWS Elastic Beanstalk** (PaaS) theory as an alternative to bare EC2.
* Learn automated deployment workflows with **CI/CD** on AWS.
* Hands-on practice deploying a basic Node.js application to Elastic Beanstalk.

### Tasks to be carried out this week:
| Day | Task | Start Date | Completion Date | Reference Material |
| --- | --- | --- | --- | --- |
| 2 | - Self-study **AWS Elastic Beanstalk** theory: environments, applications, how Beanstalk automatically manages resources | 06/01/2026 | 06/01/2026 | |
| 3 | - Compare traditional deployment using PM2 (weeks 1–2) vs using **Elastic Beanstalk** | 06/02/2026 | 06/02/2026 | |
| 4 | - Hands-on practice: Package and deploy a basic Node.js backend application to Elastic Beanstalk | 06/03/2026 | 06/03/2026 | |
| 5 | - Explore AWS CI/CD tools: **CodeCommit**, **CodeBuild**, **CodePipeline** | 06/04/2026 | 06/04/2026 | |
| 6 | - Research methods to integrate source code from GitHub/CodeCommit via CodePipeline for automated deployment to Beanstalk | 06/05/2026 | 06/05/2026 | |

### Week 7 Achievements:

This week I transitioned to more advanced practical implementations: **PaaS and CI/CD**. Previously, deploying a backend to EC2 meant using **PM2** and manually configuring environments step-by-step (weeks 1–2). By switching to **AWS Elastic Beanstalk**, everything from the Load Balancer and Auto Scaling to EC2 instances is fully managed — much cleaner, easier to manage, and safer for production.

Mid-week I successfully deployed a basic Node.js backend to Beanstalk. After that, I started exploring the AWS CI/CD ecosystem (**CodePipeline, CodeBuild**). Compared to manually copying code to a server, setting up an automated pipeline (push code → auto-build → deploy to Beanstalk) is significantly more professional. Although I haven't completed a full pipeline setup yet, I now understand the overall flow in preparation for a larger project.
