---
title : "CI/CD Pipeline"
date : 2024-01-01
weight : 8
chapter : false
pre : " <b> 5.8. </b> "
---

### Deployment Automation (CI/CD Pipeline)

In this chapter, we will set up Continuous Integration and Continuous Deployment (CI/CD) pipelines for both the **Backend API Server** and **Worker Server** using **AWS CodeCommit**, **AWS CodeBuild**, and **AWS CodePipeline**.

#### Implementation Steps:

1. **[CI/CD for Backend API Server](5.8.1-backend/)**
   * Initialize HTTPS Git Credentials for your IAM User.
   * Create a Git Repository `ticket-app-backend` on AWS CodeCommit.
   * Create a CodeBuild project to package the code.
   * Set up a CodePipeline to automatically trigger deployment to Beanstalk Backend when new code is pushed.

2. **[CI/CD for Worker Server](5.8.2-worker/)**
   * Create a Git Repository `ticket-app-worker` on AWS CodeCommit.
   * Create a CodeBuild project and CodePipeline to automatically deploy code to Beanstalk Worker.
