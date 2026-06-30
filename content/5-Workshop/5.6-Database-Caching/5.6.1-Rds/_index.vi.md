---
title : "RDS PostgreSQL & RDS Proxy"
date : 2024-01-01
weight : 1
chapter : false
pre : " <b> 5.6.1. </b> "
---

### Cơ sở dữ liệu RDS PostgreSQL & RDS Proxy

Trong phần này, chúng ta sẽ cấu hình cơ sở dữ liệu quan hệ **Amazon RDS PostgreSQL** (Multi-AZ) và tích hợp **RDS Proxy** để tối ưu hóa quản lý kết nối đồng thời từ các máy chủ API/Worker.

---

#### 1. Khởi tạo Amazon RDS PostgreSQL Multi-AZ

Để tăng tính bảo mật, toàn bộ database instance chỉ được phép kết nối nội bộ từ Private Subnets và được triển khai Multi-AZ để tự động sao lưu dự phòng.

1. Mở [Amazon RDS console](https://us-east-1.console.aws.amazon.com/rds/home?region=us-east-1#).
2. Tạo nhóm Subnet cho Database trước:
   * Trên thanh điều hướng trái, chọn **Subnet groups** -> click **Create DB subnet group**.
   * **Name**: ```db-subnet-group-ticket-app```.
   * **VPC**: Chọn VPC ```ticket-app-vpc```.
   * **Availability Zones**: Chọn các Zone ```us-east-1a``` và ```us-east-1b```.
   * **Subnets**: Tích chọn hai **Private Subnets** (CIDR `10.0.11.0/24` và `10.0.12.0/24`).
   * Click **Create**.

![Create DB Subnet Group](/images/5-Workshop/5.6-Database-Caching/db_subnet_group.png)

3. Quay lại **Databases** -> click **Create database**:
   * **Engine options**: Chọn **PostgreSQL**.
   * **Templates**: Chọn **Production** hoặc **Dev/Test** tùy thuộc vào ngân sách lab.
   * **Deployment options**: Chọn **Multi-AZ DB instance** (AWS sẽ tự động tạo một instance dự phòng đồng bộ tại Availability Zone thứ hai).
   * **Settings**:
     * **DB instance identifier**: ```database-ticket-app```.
     * **Master username**: ```postgres```.
     * **Master password**: Nhập mật khẩu khớp với mật khẩu đã tạo ở Secrets Manager.
   * **Connectivity**:
     * **Virtual private cloud (VPC)**: Chọn VPC của bạn.
     * **DB subnet group**: Chọn ```db-subnet-group-ticket-app``` vừa tạo ở Bước 2.
     * **Public access**: Chọn **No** (Chặn hoàn toàn kết nối từ Internet).
     * **VPC security group**: Chọn Security Group dành cho RDS Database (tên chứa `ticket-app-rds-instance-sg`).
   * Click **Create database** ở cuối trang.

![RDS Database created](/images/5-Workshop/5.6-Database-Caching/rds_database.png)

---

#### 2. Cấu hình Amazon RDS Proxy

1. Trên thanh điều hướng RDS, chọn **Proxies** -> click **Create proxy**.
2. Trong giao diện cấu hình **Create proxy**:
   * **Proxy identifier**: ```rds-proxy-ticket-app```.
   * **Engine family**: Chọn **PostgreSQL**.
   * **Target group configuration**:
     * **Database**: Chọn RDS Instance ```database-ticket-app``` vừa tạo ở Bước 1.
   * **Authentication**:
     * **Secrets Manager secret**: Chọn Secret ```ticket-app/rds/credentials``` đã tạo ở phần trước.
     * **IAM role**: Chọn **Create an IAM role** để hệ thống tự tạo role cấp quyền cho Proxy đọc mật khẩu từ Secret.
   * **Connectivity**:
     * **Subnets**: Tích chọn các Private Subnets.
     * **VPC security group**: Chọn Security Group dành cho RDS Proxy (tên chứa `ticket-app-rds-proxy-sg`).
3. Click **Create proxy**.

![RDS Proxy created](/images/5-Workshop/5.6-Database-Caching/rds_proxy.png)

4. Khi proxy đã khởi tạo thành công, copy địa chỉ **Proxy endpoint** hiển thị tại thông tin của proxy để sử dụng kết nối.
