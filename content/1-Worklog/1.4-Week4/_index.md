---
title: "Week 4 Worklog"
date: 2024-01-01
weight: 4
chapter: false
pre: " <b> 1.4. </b> "
---

### Week 4 Goals:

* Get a solid grasp of **IAM** — how to control access to AWS resources.
* Understand the basic **security layers** on AWS.
* Practice access control and Security Group configuration directly on the Console.

### Daily breakdown:

| Day | Work performed | Start Date | Completion Date | Reference |
| --- | --- | --- | --- | --- |
| Monday | - Study **IAM**: Users, Groups, Roles, Policies <br> - Understand how IAM controls access to each AWS service <br> - Principle of Least Privilege | 05/11/2026 | 05/11/2026 | |
| Tuesday | - Study AWS security layers: Security Group, NACL, VPC flow logs <br> - Differentiate Security Group (stateful) vs NACL (stateless) | 05/12/2026 | 05/12/2026 | |
| Wednesday | - Hands-on IAM on Console <br> - Create an IAM User, attach a Policy, verify access permissions <br> - Review account security recommendations (MFA, root account lockdown) | 05/13/2026 | 05/13/2026 | |
| Thursday | - Study **AWS Organizations** and multi-account management <br> - Study **CloudTrail** to track account activity and changes | 05/14/2026 | 05/14/2026 | |
| Friday | - Hands-on Security Group: open EC2 on Console <br> - View and adjust inbound/outbound rules (SSH, HTTP, HTTPS) <br> - Apply Least Privilege principle in a real configuration | 05/15/2026 | 05/15/2026 | |

### Weekly outcomes:

This week focused entirely on **IAM and security** — two areas many beginners skip but that are critical in any real-world AWS setup. IAM isn't just about "creating users" — it's the foundation for controlling who can do what across the entire infrastructure.

The trickiest part was distinguishing **Security Group** (operates at instance level, stateful — allowing inbound automatically covers the corresponding outbound response) from **NACL** (operates at subnet level, stateless — both inbound and outbound rules must be explicitly defined). The difference only became clear after actually working with both on the Console.

Learning about **CloudTrail** also turned out to be immediately relevant — in production environments, knowing who did what and when is essential for incident response, not optional.
