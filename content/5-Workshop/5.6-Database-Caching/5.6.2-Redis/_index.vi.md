---
title : "Cấu hình ElastiCache Redis"
date : 2024-01-01
weight : 2
chapter : false
pre : " <b> 5.6.2. </b> "
---

### Cấu hình Amazon ElastiCache Redis

Trong phần này, chúng ta sẽ tạo cache lưu trữ dữ liệu tạm thời bằng cụm bộ nhớ đệm **Amazon ElastiCache Redis**.

---

#### Các bước thực hiện:

1. Mở [Amazon ElastiCache console](https://us-east-1.console.aws.amazon.com/elasticache/home?region=us-east-1#/clusters).
2. Tạo nhóm Subnet cho Redis:
   * Trên thanh điều hướng, chọn **Subnet groups** -> click **Create cache subnet group**.
   * **Name**: ```ticket-app-redis-subnet-group``` -> Chọn VPC của bạn.
   * **Subnets**: Chọn hai **Private Subnets** -> click **Create**.

3. Quay lại **Redis clusters** -> click **Create Redis cluster**:
   * **Cluster mode**: Chọn **Disabled** (Chúng ta sẽ dùng cơ chế Primary/Replica đơn giản).
   * **Name** / **Replication group ID**: ```ticket-app-redis```.
   * **Node type**: Chọn node nhỏ như ```cache.t3.micro```.
   * **Number of replicas**: Nhập ```1```.
   * **Subnet group**: Chọn ```ticket-app-redis-subnet-group``` vừa tạo ở Bước 2.
   * **Security**: Chọn Security Group dành cho Redis (tên chứa `ticket-app-redis-sg`).
4. Click **Create** để hoàn thành khởi tạo.

![Redis Cluster created](/images/5-Workshop/5.6-Database-Caching/redis_cluster.png)

5. Khi cụm Redis đã tạo xong, copy địa chỉ **Primary endpoint** của cụm để cấu hình.
