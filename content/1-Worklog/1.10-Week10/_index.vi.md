---
title: "Worklog Tuần 10"
date: 2024-01-01
weight: 10
chapter: false
pre: " <b> 1.10. </b> "
---
### Mục tiêu tuần 10:

* Thiết lập hạ tầng mạng lõi: VPC, Subnet, NAT Gateway, Security Group.
* Khởi tạo tầng dữ liệu: **RDS PostgreSQL**, **ElastiCache Redis**.
* Thiết lập dịch vụ hàng đợi và xác thực: **SQS FIFO**, **Cognito**.

### Các công việc cần triển khai trong tuần này:
| Thứ | Công việc | Ngày bắt đầu | Ngày hoàn thành | Nguồn tài liệu |
| --- | --- | --- | --- | --- |
| 2 | - Thiết kế VPC, phân chia Subnet Public/Private trên 2 Availability Zones, NAT Gateways và thiết lập Security Group Chaining | 22/06/2026 | 22/06/2026 | <https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html> |
| 3 | - Triển khai **RDS PostgreSQL Multi-AZ** kết hợp **RDS Proxy** và khởi tạo cụm **ElastiCache Redis** | 23/06/2026 | 23/06/2026 | <https://aws.amazon.com/rds/> |
| 4 | - Cấu hình **Amazon Cognito User Pool** để quản lý đăng nhập và xác thực người dùng | 24/06/2026 | 24/06/2026 | <https://aws.amazon.com/cognito/> |
| 5 | - Khởi tạo **SQS FIFO Queue** (Booking Queue & Dead Letter Queue - DLQ) để đảm bảo thứ tự mua vé | 25/06/2026 | 25/06/2026 | <https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-fifo-queues.html> |
| 6 | - Kiểm tra khả năng kết nối an toàn từ môi trường test tới Database, Cache và Queue | 26/06/2026 | 26/06/2026 | <https://aws.amazon.com/vpc/> |

### Kết quả đạt được tuần 10:

Tuần này triển khai thành công phần hạ tầng lõi cho hệ thống Flash Sale. Đã hoàn thành **VPC** bảo mật với Public/Private Subnet trên 2 AZ, cùng **Security Group** và **NAT Gateway**.

Trong tầng dữ liệu, đã triển khai **RDS PostgreSQL Multi-AZ** với **RDS Proxy** và **ElastiCache Redis**. Đồng thời đã cấu hình **Cognito User Pool** và tạo hàng đợi **SQS FIFO** cho luồng booking. Hạ tầng đã sẵn sàng cho việc deploy ứng dụng và xử lý tải cao.
