---
title: "Worklog Tuần 8"
date: 2024-01-01
weight: 8
chapter: false
pre: " <b> 1.8. </b> "
---

### Mục tiêu tuần này:

* Nghiên cứu kiến trúc **hướng sự kiện (Event-Driven)** và thiết kế luồng xử lý bất đồng bộ dùng **Amazon SQS** + **SNS**.
* Tích hợp SQS và SNS vào luồng xử lý của dự án đặt vé.
* Thực hành cấu hình SNS Topic và SQS Queue trực tiếp trên AWS Console.

### Công việc từng ngày:

| Ngày | Nội dung công việc | Ngày bắt đầu | Ngày hoàn thành | Tài liệu tham khảo |
| --- | --- | --- | --- | --- |
| Thứ 2 | - Nghiên cứu **Event-Driven Architecture** trên AWS <br> - Hiểu tại sao cần xử lý bất đồng bộ và các pattern phổ biến | 08/06/2026 | 08/06/2026 | |
| Thứ 3 | - Thiết kế luồng xử lý bất đồng bộ bằng **Amazon SQS** và **SNS** cho hệ thống đặt vé <br> - Tìm hiểu SQS Standard vs FIFO và SNS (topic, subscription) | 09/06/2026 | 09/06/2026 | |
| Thứ 4 | - Tích hợp **SQS** làm hàng đợi xử lý request thanh toán <br> - Cấu hình **SNS** để gửi email xác nhận và vé điện tử cho khách hàng | 10/06/2026 | 10/06/2026 | |
| Thứ 5 | - Viết test script cho luồng xử lý bất đồng bộ <br> - Xử lý lỗi phát sinh khi truyền message qua SQS/SNS <br> - Cấu hình Dead Letter Queue (DLQ) để đảm bảo không mất message | 11/06/2026 | 11/06/2026 | |
| Thứ 6 | - Ôn lại toàn bộ kiến trúc **SQS + SNS** đã tích hợp <br> - Viết kịch bản test kiểm thử luồng bất đồng bộ end-to-end | 12/06/2026 | 12/06/2026 | |
| Thứ 7 | - Thực hành cấu hình **SNS Topic** và **SQS Queue** trực tiếp trên AWS Console <br> - Chạy thử gửi message, kiểm tra nhận notification | 13/06/2026 | 13/06/2026 | |

### Kết quả trong tuần:

Tuần này đi vào vùng hoàn toàn mới: **kiến trúc hướng sự kiện**. Ý tưởng cốt lõi là: khi nhiều người đặt vé cùng lúc, thay vì xử lý tuần tự dễ gây nghẽn, request thanh toán được đẩy vào **SQS queue** để worker xử lý riêng biệt — sau đó **SNS** gửi email xác nhận và vé điện tử đến khách hàng.

Điểm mình thấy rõ nhất là sự khác biệt giữa **Standard Queue** (nhanh, có thể trùng lặp) và **FIFO Queue** (đảm bảo thứ tự, không trùng) — tùy bài toán mà chọn. Cấu hình **Dead Letter Queue** là phần quan trọng nhất: đảm bảo message thất bại không bị mất mà được lưu lại để xử lý sau.

Thứ 7 tự tay cấu hình SQS và SNS trực tiếp trên Console, chạy thử toàn bộ luồng — từ push message vào queue đến nhận notification. Nhìn flow chạy thật sự (không phải chỉ vẽ sơ đồ) giúp mình hiểu sâu hơn nhiều so với chỉ đọc tài liệu.
