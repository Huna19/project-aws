---
title : "Network & Security Infrastructure"
date : 2024-01-01
weight : 3
chapter : false
pre : " <b> 5.3. </b> "
---

### Network & Security Infrastructure

In this chapter, we will establish a solid network infrastructure foundation and configure multi-layered security on AWS to run the **Ticketing App** application.

The network infrastructure will be designed with Multi-AZ availability, integrating Public/Private Subnets, NAT Gateways, Security Groups, and Secrets Manager for password management.

#### Implementation Steps:

1. **[Create VPC & Subnets](5.3.1-vpc-subnets/)**
   * Create an Amazon VPC with CIDR block `10.0.0.0/16`.
   * Split into 4 Subnets: 2 Public Subnets and 2 Private Subnets across 2 different Availability Zones.

2. **[Configure Routing & NAT Gateways](5.3.2-routing/)**
   * Create an Internet Gateway (IGW) to provide Internet connectivity for Public Subnets.
   * Create 2 NAT Gateways associated with EIPs to allow Private Subnets to securely connect to the Internet.
   * Configure Route Tables to separate Public and Private network traffic flows.

3. **[Security & Security Groups](5.3.3-security/)**
   * Create AWS Secrets Manager to centrally store database credentials.
   * Set up 5 layered Security Groups for Load Balancer, EC2 instances, RDS Proxy, RDS Database, and Redis Cache.
