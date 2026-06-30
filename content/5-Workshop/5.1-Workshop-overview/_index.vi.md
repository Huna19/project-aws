---
title : "Giới thiệu"
date : 2024-01-01 
weight : 1
chapter : false
pre : " <b> 5.1. </b> "
---

#### Giới thiệu về ứng dụng Ticket-App

**Ticket-App** là một ứng dụng web đặt vé sự kiện trực tuyến đa nhiệm (Concerts, liveshow ca nhạc, giải đấu thể thao, World Cup...) có khả năng mở rộng cao, bảo mật và chịu lỗi tốt. Mục tiêu chính của workshop này là hướng dẫn bạn từng bước tự xây dựng và triển khai kiến trúc 3-tier hoàn chỉnh cho hệ thống này trên AWS bằng cách kết hợp các dịch vụ hạ tầng mạng, máy chủ ảo co giãn tự động, hệ thống hàng đợi bất đồng bộ và cơ sở dữ liệu dự phòng nóng.

#### Tổng quan về workshop

Trong workshop này, bạn sẽ thực hành xây dựng hệ thống với các thành phần cốt lõi:

*   **Tầng Web Frontend:** Ứng dụng giao diện tĩnh được lưu trữ trên **Amazon S3** (Static Website Hosting), phân phối toàn cầu thông qua mạng phân phối nội dung **Amazon CloudFront** (sẵn sàng tích hợp bảo vệ bởi **AWS WAF**).
*   **Tầng Web Backend (API Tier):** Cụm máy chủ API chạy trên **Amazon EC2** được quản lý và tự động co giãn bằng **AWS Elastic Beanstalk (Web Server Environment)**. Nhóm API này tiếp nhận yêu cầu đặt vé từ Client, thực hiện kiểm tra và đẩy ngay thông tin đặt vé vào hàng đợi để phản hồi tức thì cho người dùng.
*   **Tầng hàng đợi (Messaging Tier):** Hàng đợi **Amazon SQS FIFO** tiếp nhận các tin nhắn đặt vé, đảm bảo xử lý chính xác theo thứ tự thời gian và không trùng lặp (exactly-once processing). Tích hợp **Dead Letter Queue (DLQ)** để cô lập các giao dịch lỗi.
*   **Tầng xử lý giao dịch (Worker Tier):** Cụm máy chủ xử lý chạy dưới dạng **AWS Elastic Beanstalk (Web Server Environment - cấu hình chạy polling worker)** liên tục lắng nghe (polling) hàng đợi SQS FIFO để thực thi tác vụ ghi nhận đặt vé và cập nhật dữ liệu.
*   **Tầng Cơ sở dữ liệu & Caching (Database & Caching Tier):** Cơ sở dữ liệu quan hệ **RDS PostgreSQL** chạy trên cấu hình **Multi-AZ** (dự phòng nóng), kết hợp **RDS Proxy** để chia sẻ tài nguyên kết nối (Connection Pooling). Cụm **ElastiCache Redis** (Primary/Replica) hỗ trợ lưu cache thông tin sự kiện để giảm tải đọc cho database.
*   **Dịch vụ bổ trợ & Bảo mật:** Xác thực người dùng bằng **Amazon Cognito**, quản lý mã hóa thông tin đăng nhập bằng **AWS Secrets Manager**, gửi email vé điện tử tự động qua **Amazon SES**, giám sát hệ thống với **Amazon CloudWatch** và gửi thông báo lỗi qua **Amazon SNS**.

Sơ đồ kiến trúc chi tiết bạn sẽ xây dựng trong bài thực hành:

![overview](/images/5-Workshop/5.1-Workshop-overview/ticket_app_architecture.png)


