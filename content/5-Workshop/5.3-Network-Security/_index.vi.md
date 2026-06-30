---
title : "Hạ tầng Mạng & Bảo mật"
date : 2024-01-01
weight : 3
chapter : false
pre : " <b> 5.3. </b> "
---

### Hạ tầng Mạng & Bảo mật (Network & Security)

Trong chương này, chúng ta sẽ thiết lập nền móng hạ tầng mạng vững chắc và cấu hình các lớp bảo mật đa tầng trên AWS để chạy ứng dụng **Ticketing App**.

Hạ tầng mạng sẽ được thiết kế đa vùng sẵn sàng (Multi-AZ), tích hợp Public/Private Subnets, NAT Gateways, Security Groups và Secrets Manager để quản lý mật khẩu.

#### Các bước thực hiện:

1. **[Khởi tạo VPC & Subnets](5.3.1-vpc-subnets/)**
   * Khởi tạo mạng Amazon VPC dải CIDR `10.0.0.0/16`.
   * Chia 4 Subnets gồm 2 Public Subnets và 2 Private Subnets nằm trên 2 Availability Zones khác nhau.

2. **[Cấu hình Định tuyến & NAT Gateways](5.3.2-routing/)**
   * Tạo Internet Gateway (IGW) kết nối Internet cho Public Subnets.
   * Tạo 2 NAT Gateways và liên kết với EIPs để cho phép Private Subnets kết nối ra Internet an toàn.
   * Cấu hình bảng định tuyến (Route Tables) phân tách luồng mạng Public và Private.

3. **[Bảo mật & Security Groups](5.3.3-security/)**
   * Khởi tạo AWS Secrets Manager để lưu trữ thông tin đăng nhập database tập trung.
   * Thiết lập 5 Security Groups phân lớp bảo mật cho Load Balancer, EC2 instances, RDS Proxy, RDS Database và Redis Cache.
