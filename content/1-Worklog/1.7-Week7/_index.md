---
title: "Week 7 Worklog"
date: 2024-01-01
weight: 7
chapter: false
pre: " <b> 1.7. </b> "
---

### Week 7 Goals:

* Study **AWS Elastic Beanstalk** (PaaS) as a managed alternative to running raw EC2.
* Understand automated deployment pipelines with **CI/CD** on AWS.
* Deploy a basic Node.js app to Elastic Beanstalk and explore the CI/CD toolchain.

### Daily breakdown:

| Day | Work performed | Start Date | Completion Date | Reference |
| --- | --- | --- | --- | --- |
| Monday | - Self-study **AWS Elastic Beanstalk** theory: environments, applications, how Beanstalk automatically manages underlying resources | 06/01/2026 | 06/01/2026 | |
| Tuesday | - Compare traditional deployment with PM2 (weeks 1–2) vs using **Elastic Beanstalk** <br> - Note what Beanstalk handles automatically vs what's still developer responsibility | 06/02/2026 | 06/02/2026 | |
| Wednesday | - Hands-on: Package and deploy a basic **Node.js** backend to Elastic Beanstalk <br> - Verify the app is running via the Beanstalk environment URL | 06/03/2026 | 06/03/2026 | |
| Thursday | - Explore AWS CI/CD tools: **CodeCommit**, **CodeBuild**, **CodePipeline** <br> - Understand each tool's role in an automated deployment pipeline | 06/04/2026 | 06/04/2026 | |
| Friday | - Research how to connect source code (GitHub/CodeCommit) to **CodePipeline** for automatic deployment to Beanstalk <br> - Map out the full pipeline flow: push code → build → deploy | 06/05/2026 | 06/05/2026 | |

### Weekly outcomes:

This week moved into more advanced territory: **PaaS and CI/CD**. Previously, deploying a backend to EC2 meant manually installing Node.js, configuring the environment, and keeping PM2 running — all by hand. Switching to **Elastic Beanstalk** removes a lot of that overhead: Load Balancer, Auto Scaling, EC2 provisioning are all handled automatically, leaving more focus on the application itself.

Mid-week I successfully deployed a basic Node.js backend to Beanstalk — the first time the deployment process felt smooth rather than manual. After that, I started mapping out the AWS CI/CD ecosystem (CodeCommit, CodeBuild, CodePipeline). The pipeline concept (push code → auto-build → auto-deploy) is a significant step up from copying files to a server manually. I haven't built a complete pipeline yet, but the overall flow is clear and ready to put into practice in the next project.
