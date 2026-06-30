---
title: "Blog 2"
date: 2024-01-01
weight: 1
chapter: false
pre: " <b> 3.2. </b> "
---

# Understanding the Multi-Build Solution on Amazon GameLift Servers

## INTRODUCTION

During online game development, updating and testing multiple game server versions is a frequent task. However, deploying each new version onto the infrastructure can take a lot of time and impact test workflows.

AWS has introduced the Multi-Build solution on Amazon GameLift Servers, enabling developers to host and run multiple game server versions on the same fleet, thereby accelerating game development and testing iteration.


## WHAT IS AMAZON GAMELIFT SERVERS?

Amazon GameLift Servers is a fully managed game server hosting service provided by AWS. It helps developers deploy, operate, and scale dedicated game servers globally.

Many major game titles in the market rely on GameLift to ensure scalability and stability for millions of players.


## ISSUES IN GAME DEVELOPMENT

Typically, every time there is a new server version, developers have to:
- Rebuild the server.
- Redeploy it to the infrastructure.
- Test and verify execution.
- Toggle between versions when testing is required.

This workflow consumes substantial time, especially during Alpha and Beta stages when updates happen continuously.


## THE MULTI-BUILD SOLUTION

Multi-Build is a solution that allows hosting multiple game server versions on a single Amazon GameLift fleet.

Instead of redeploying the entire infrastructure, developers only need to:
1. Upload the new version to Amazon S3.
2. The system automatically syncs it down to the GameLift servers.
3. When creating a Game Session, specify the `BuildVersion` to be used.
4. The server automatically launches the corresponding version.

Consequently, switching between versions is much faster and more flexible.


## HOW IT WORKS (ARCHITECTURE)

The solution utilizes two main containers:

### 1. GAME SERVER CONTAINER
This container is responsible for:
- Running the game server.
- Receiving game session creation requests.
- Launching the correct server version based on the `BuildVersion`.

### 2. S3 SYNC CONTAINER
This container runs in the background and continuously:
- Checks for changes on Amazon S3.
- Synchronizes new builds.
- Deletes stale builds that are no longer used.
- Ensures data is fully downloaded before execution.

Both containers share a directory to access the synchronized builds.

<img src="/images/blog/Blog2/716962056_1849193866486013_5935965608591198664_n.jpg" alt="Multi-Build GameLift Architecture 1" class="blog-image" />
<img src="/images/blog/Blog2/719483076_1849193823152684_8697794779991986075_n.jpg" alt="Multi-Build GameLift Architecture 2" class="blog-image" />



## AWS SERVICES USED

The Multi-Build solution combines several AWS services:
- Amazon GameLift Servers
- Amazon S3
- Amazon ECR
- AWS IAM
- AWS CodeBuild
- AWS CloudFormation
- Amazon CloudWatch Logs

This automates the entire deployment and management workflow.


## BENEFITS OF MULTI-BUILD

### ACCELERATE DEVELOPMENT
Dev teams can test multiple game versions simultaneously without redeploying the fleet.

### SAVE TIME
Uploading a new build takes only a few minutes instead of a full deployment cycle.

### SUPPORT ALPHA & BETA TESTING
Multiple game versions can coexist to serve different groups of playtesters.

### EASY MANAGEMENT
Builds are centrally managed on Amazon S3 and automatically synchronized to the servers.


## CONCLUSION

Amazon GameLift Servers Multi-Build is a highly useful solution for game development teams looking to speed up testing and version releases. By allowing multiple builds to coexist on a single fleet, AWS significantly reduces deployment times and optimizes the game development lifecycle.

For game projects currently in Alpha, Beta, or active feature development, this is a solution worth exploring and adopting.


Link to original post: https://aws.amazon.com/blogs/gametech/rapid-game-server-iteration-on-amazon-gamelift-servers/
