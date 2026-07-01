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
| 2 | - Thiết kế VPC, phân chia Subnet Public/Private trên 2 Availability Zones, NAT Gateways và thiết lập Security Group Chaining | 22/06/2026 | 22/06/2026 | |
| 3 | - Triển khai **RDS PostgreSQL Multi-AZ** kết hợp **RDS Proxy** và khởi tạo cụm **ElastiCache Redis** | 23/06/2026 | 23/06/2026 | |
| 4 | - Cấu hình **Amazon Cognito User Pool** để quản lý đăng nhập và xác thực người dùng | 24/06/2026 | 24/06/2026 | |
| 5 | - Khởi tạo **SQS FIFO Queue** (Booking Queue & Dead Letter Queue - DLQ) để đảm bảo thứ tự mua vé | 25/06/2026 | 25/06/2026 | |
| 6 | - Kiểm tra khả năng kết nối an toàn từ môi trường test tới Database, Cache và Queue | 26/06/2026 | 26/06/2026 | |

### Kết quả đạt được tuần 10:

Tuần này, dự án triển khai hệ thống bán vé Flash Sale chính thức khởi động (Giai đoạn 1). 

Mình đã hoàn tất việc thiết lập hạ tầng mạng bảo mật với **VPC**, phân chia rạch ròi Public/Private Subnet trên 2 AZs. Ở tầng dữ liệu, thay vì cấu hình thông thường, mình đã triển khai **RDS PostgreSQL Multi-AZ** kết hợp với **RDS Proxy** (giúp quản lý connection pool tốt hơn khi hệ thống chịu tải) và khởi tạo thành công **ElastiCache Redis**.

Ngoài ra, mình đã setup xong **Cognito User Pool** để chuẩn bị cho luồng đăng nhập và tạo các hàng đợi **SQS FIFO** (gồm Booking Queue và DLQ) để xử lý logic giữ chỗ. Mọi kết nối từ môi trường test nội bộ đến DB và Cache đều đã được xác thực an toàn qua Security Group. Hạ tầng lõi đã sẵn sàng cho tuần deploy ứng dụng tiếp theo!
