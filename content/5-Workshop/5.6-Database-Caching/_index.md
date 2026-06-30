---
title : "Database & Caching Tier"
date : 2024-01-01
weight : 6
chapter : false
pre : " <b> 5.6. </b> "
---

### Database & Caching Tier

In this chapter, we will configure the **Amazon RDS PostgreSQL** relational database (Multi-AZ), integrate **RDS Proxy** for connection optimization, and deploy **Amazon ElastiCache Redis** as a caching layer to improve data retrieval speed.

#### Implementation Steps:

1. **[Database & RDS Proxy](5.6.1-rds/)**
   * Create a DB Subnet Group and deploy an RDS PostgreSQL Multi-AZ instance within Private Subnets.
   * Create an RDS Proxy linked to the Database and connected to Secrets Manager for enhanced security and performance.

2. **[Redis Cache](5.6.2-redis/)**
   * Create a Subnet Group for ElastiCache.
   * Deploy an Amazon ElastiCache Redis replication group cluster for session and temporary data storage.
