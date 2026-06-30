---
title : "Cognito User Pool"
date : 2024-01-01
weight : 1
chapter : false
pre : " <b> 5.7.1. </b> "
---

### Quản lý định danh với Amazon Cognito

Cognito sẽ quản lý việc đăng ký tài khoản, đăng nhập và tự động cấp mã Access Token dạng JWT cho Client.

---

#### Các bước thực hiện:

1. Mở [Amazon Cognito console](https://us-east-1.console.aws.amazon.com/cognito/v2/home?region=us-east-1#).
2. Chọn **User pools** -> Click **Create user pool**.
3. Trong phần **Define your application**:
   * **Application type**: Chọn **Single-page application (SPA)** *(Loại ứng dụng này mặc định không tạo Client Secret, phù hợp với kiến trúc React SPA)*.
4. Trong phần **Name your application**:
   * Nhập tên ứng dụng: ```ticket-app-user-pool```.
5. Trong phần **Configure options**, cấu hình các thiết lập cơ bản:
   * **Sign-in identifiers**: Chọn **Email**.
   * **Required attributes**: Giữ mặc định.
   * **Authentication options**: Chọn **No MFA**.
   * **Password policy**: Giữ mặc định.
   * **Self-service sign-up**: Giữ mặc định (Cho phép tự đăng ký).
6. Click **Create user pool**. (Cognito sẽ tự động tạo User Pool kèm theo một App Client tương ứng).

   ![Cognito User Pool created](/images/5-Workshop/5.7-Auth-API-Gateway/cognito_userpool.png)

7. Từ trang chi tiết của User Pool vừa tạo, bạn copy lại 2 thông số sau để dùng cho bài sau (cấu hình API Gateway và Frontend):
   * **User Pool ID** (hiển thị ngay ở trang tổng quan).
   * **App Client ID** (chuyển sang mục *App clients*, copy Client ID).

*(Lưu ý: Nếu cần thay đổi cấu hình gửi email Cognito hoặc các tính năng nâng cao khác, bạn có thể chỉnh sửa tại các mục Authentication, Sign-up, Message templates... sau khi User Pool đã được tạo).*
