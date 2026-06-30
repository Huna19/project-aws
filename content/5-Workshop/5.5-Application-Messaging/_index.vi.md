---
title : "Tầng Ứng dụng & Xử lý bất đồng bộ"
date : 2024-01-01
weight : 5
chapter : false
pre : " <b> 5.5. </b> "
---

### Tầng Ứng dụng & Xử lý bất đồng bộ (Application & Messaging Tier)

Trong chương này, chúng ta sẽ cấu hình hàng đợi tin nhắn **Amazon SQS FIFO** và môi trường ứng dụng **AWS Elastic Beanstalk** Node.js để chạy API Backend và xử lý các tác vụ đặt vé ngầm một cách bất đồng bộ.

#### Các bước thực hiện:

1. **[Cấu hình Hàng đợi (SQS FIFO & DLQ)](5.5.1-queue/)**
   * Khởi tạo hàng đợi chính `booking-queue.fifo` nhận yêu cầu đặt vé.
   * Tạo Dead Letter Queue (DLQ) `checkout-dlq.fifo` chứa các tin nhắn bị lỗi quá số lần xử lý.

2. **[Triển khai Beanstalk (Backend API & Worker)](5.5.2-beanstalk/)**
   * Triển khai máy chủ Web API `ticket-app-Backend-env` trong dải mạng Private Subnet đứng sau Load Balancer.
   * Triển khai máy chủ Worker `ticket-app-Worker-env` xử lý hàng đợi.
   * Cấu hình các biến môi trường (Environment properties) cho Beanstalk.

3. **[Thông báo SNS & Giám sát DLQ](5.5.3-sns/)**
   * Tạo 2 SNS Topics gửi thông báo qua email cho đội vận hành (Ops) và người dùng cuối (User).
   * Cấu hình CloudWatch Alarm giám sát Dead Letter Queue, cảnh báo khi có đơn đặt vé bị lỗi.
