---
title : "Configure ElastiCache Redis"
date : 2024-01-01
weight : 2
chapter : false
pre : " <b> 5.6.2. </b> "
---

### Configure Amazon ElastiCache Redis

In this section, we will create a temporary cache cluster using **Amazon ElastiCache Redis**.

---

#### Step-by-Step Instructions:

1. Open the [Amazon ElastiCache console](https://us-east-1.console.aws.amazon.com/elasticache/home?region=us-east-1#/clusters).
2. Create Subnet Group for Redis:
   * Select **Subnet groups** -> click **Create cache subnet group**.
   * **Name**: ```ticket-app-redis-subnet-group``` -> Select your VPC.
   * **Subnets**: Select two **Private Subnets** -> click **Create**.

3. Go back to **Redis clusters** -> click **Create Redis cluster**:
   * **Cluster mode**: Select **Disabled** (Simple Primary/Replica mechanism).
   * **Name** / **Replication group ID**: ```ticket-app-redis```.
   * **Node type**: Select ```cache.t3.micro```.
   * **Number of replicas**: Enter ```1```.
   * **Subnet group**: Select ```ticket-app-redis-subnet-group```.
   * **Security**: Select Redis Security Group (e.g. `ticket-app-redis-sg`).
4. Click **Create** to initialize.

![Redis Cluster created](/images/5-Workshop/5.6-Database-Caching/redis_cluster.png)

5. Once created, copy the **Primary endpoint** of the cluster.
