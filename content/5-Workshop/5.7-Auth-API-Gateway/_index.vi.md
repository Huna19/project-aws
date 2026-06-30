---
title : "Xác thực & Cổng API"
date : 2024-01-01
weight : 7
chapter : false
pre : " <b> 5.7. </b> "
---

### Xác thực & Cổng API (Authentication & API Gateway)

Trong chương này, chúng ta sẽ xây dựng cổng xác thực người dùng tập trung thông qua **Amazon Cognito** và thiết lập cổng API **Amazon API Gateway** làm cầu nối định tuyến các request từ Frontend đến các dịch vụ Backend bảo mật.

#### Các bước thực hiện:

1. **[Đăng ký định danh (Cognito User Pool)](5.7.1-cognito/)**
   * Khởi tạo Cognito User Pool quản lý tài khoản email khách hàng.
   * Tạo App Client (tắt client secret) để tương thích bảo mật cho Single Page Application (SPA).

2. **[Cổng kết nối API & JWT Authorizer](5.7.2-apigateway/)**
   * Tạo API Gateway dạng HTTP API.
   * Tạo Cognito JWT Authorizer đọc token xác thực từ header.
   * Cấu hình phân tách các HTTP routes: Các API xem danh sách trận đấu được truy cập Public, các API đặt vé yêu cầu đăng nhập (Protected).
