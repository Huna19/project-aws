---
title : "Tầng Cơ sở dữ liệu & Bộ nhớ đệm"
date : 2024-01-01
weight : 6
chapter : false
pre : " <b> 5.6. </b> "
---

### Tầng Cơ sở dữ liệu & Bộ nhớ đệm (Database & Caching Tier)

Trong chương này, chúng ta sẽ cấu hình cơ sở dữ liệu quan hệ **Amazon RDS PostgreSQL** (Multi-AZ), tích hợp **RDS Proxy** để tối ưu hóa kết nối, và triển khai **Amazon ElastiCache Redis** làm bộ nhớ đệm tăng tốc độ truy xuất.

#### Các bước thực hiện:

1. **[Cơ sở dữ liệu & RDS Proxy](5.6.1-rds/)**
   * Khởi tạo nhóm Subnet cho Database và tạo RDS PostgreSQL Multi-AZ nằm trong Private Subnets.
   * Tạo RDS Proxy liên kết với Database và kết nối với Secrets Manager để tăng cường bảo mật và hiệu năng.

2. **[Bộ nhớ đệm Redis](5.6.2-redis/)**
   * Khởi tạo nhóm Subnet cho ElastiCache.
   * Triển khai cụm bộ nhớ đệm Amazon ElastiCache Redis replication group để lưu trữ các session và dữ liệu tạm thời.
