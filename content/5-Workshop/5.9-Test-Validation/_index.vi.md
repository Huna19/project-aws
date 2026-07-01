---
title : "Kiểm thử & Xác thực"
date : 2024-01-01
weight : 9
chapter : false
pre : " <b> 5.9. </b> "
---

### Kiểm thử & Xác thực (Test & Validation)

Sau khi hệ thống đã được triển khai hoàn tất thông qua CI/CD, bước tiếp theo là xác thực khả năng hoạt động, độ chịu tải và cơ chế chịu lỗi của kiến trúc 3-tier. 

Trong bài lab này, chúng ta sẽ thực hiện end-to-end các bước kiểm thử theo đúng luồng người dùng và luồng hệ thống.

---

#### 1. Gửi Request & Xác thực luồng Frontend - Backend
**Kịch bản:** Mô phỏng người dùng mua vé sự kiện từ giao diện web.

*   **Bước 1:** Truy cập vào domain của **CloudFront** (hoặc S3 Website endpoint) mà bạn đã lấy ở phần triển khai Frontend.
*   **Bước 2:** Đăng nhập tài khoản bằng **Cognito** (Đăng ký tài khoản mới nếu cần, sau đó xác thực qua email).
*   **Bước 3:** Nhấn vào một sự kiện đang mở bán, chọn số lượng vé và nhấn **"Đặt vé ngay" (Book Now)**.
*   **Kết quả mong đợi:** Giao diện hiển thị trạng thái *"Đang xử lý"* ngay lập tức (phản hồi API < 200ms). Người dùng không bị treo trình duyệt chờ đợi hệ thống ghi database.

---

#### 2. Kiểm tra Metric & Message Queue (SQS)
**Kịch bản:** Xác thực tin nhắn đã được Backend API đẩy thành công vào hàng đợi SQS.

*   **Bước 1:** Đăng nhập vào AWS Console, truy cập dịch vụ **SQS**.
*   **Bước 2:** Chọn hàng đợi `booking-queue.fifo`.
*   **Bước 3:** Chuyển sang tab **Monitoring**.
*   **Kết quả mong đợi:** Bạn sẽ thấy biểu đồ **Number Of Messages Sent** tăng lên tương ứng với số lượng request đặt vé. Nếu Worker đang chạy tốt, biểu đồ **Number Of Messages Deleted** cũng sẽ tăng ngay sau đó (do Worker đã tiêu thụ tin nhắn).

---

#### 3. Xem Log trên CloudWatch & Elastic Beanstalk
**Kịch bản:** Kiểm tra quá trình Worker xử lý đơn hàng và ghi vào cơ sở dữ liệu PostgreSQL.

*   **Bước 1:** Truy cập **CloudWatch** -> **Log groups**.
*   **Bước 2:** Tìm Log group của môi trường **Beanstalk Worker** (thường có định dạng `/aws/elasticbeanstalk/ticket-app-worker/var/log/nodejs/nodejs.log`).
*   **Bước 3:** Tìm kiếm các từ khóa như `Order processed successfully` hoặc `Database inserted`.
*   **Kết quả mong đợi:** Log hiển thị chi tiết tiến trình worker lấy tin nhắn từ SQS, xử lý logic trừ vé (inventory), lưu thông tin vé vào RDS PostgreSQL và xóa tin nhắn khỏi hàng đợi.

---

#### 4. Xác thực kết quả đầu ra (Email SES / SNS)
**Kịch bản:** Khách hàng phải nhận được email chứa vé điện tử (e-ticket).

*   **Bước 1:** Kiểm tra hộp thư (inbox) của email bạn dùng để đăng ký tài khoản Cognito.
*   **Kết quả mong đợi:** Một email xác nhận từ **Amazon SES** chứa thông tin vé điện tử và mã QR code được gửi đến thành công. Nếu có độ trễ, thời gian không quá 1-2 phút sau khi bấm đặt vé.

---

#### 5. Kiểm thử lỗi (Chaos / Fault Tolerance Testing)
**Kịch bản:** Mô phỏng sự cố ngắt kết nối cơ sở dữ liệu hoặc lỗi code xử lý để xem hệ thống có mất đơn hàng hay không.

*   **Bước 1:** Cố tình thay đổi mật khẩu RDS trong Secrets Manager thành sai, HOẶC truy cập vào Beanstalk Worker chỉnh Capacity xuống 0 để tắt toàn bộ Worker.
*   **Bước 2:** Tiếp tục lên giao diện Frontend thực hiện đặt vé liên tục.
*   **Bước 3:** Kiểm tra SQS.
*   **Kết quả mong đợi:** 
    * API Backend vẫn phản hồi *"Đang xử lý"* nhanh chóng, không bị sập. 
    * Do Worker bị lỗi (không kết nối được DB) hoặc bị tắt, tin nhắn sẽ bị giữ lại trong `booking-queue.fifo`. 
    * Sau số lần retries thất bại, tin nhắn đơn hàng sẽ tự động bị đẩy sang **Dead Letter Queue (checkout-dlq.fifo)**.
    * Khi sự cố được khắc phục (khôi phục Worker/DB), quản trị viên có thể dùng tính năng *Redrive* từ DLQ đưa tin nhắn trở lại hàng đợi chính để xử lý tiếp. **Tuyệt đối không có đơn hàng nào bị mất mát.**

Đến đây, bạn đã hoàn tất việc kiểm thử và chứng minh được sức mạnh của kiến trúc phân rã (Decoupled Architecture) trên AWS. Chuyển sang phần tiếp theo để tiến hành dọn dẹp tài nguyên.
