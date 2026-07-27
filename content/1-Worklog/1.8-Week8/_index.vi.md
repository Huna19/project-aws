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
| Thứ 2 | - Nghiên cứu **Event-Driven Architecture** trên AWS <br> - Hiểu tại sao cần xử lý bất đồng bộ và các pattern phổ biến | 08/06/2026 | 08/06/2026 | <https://aws.amazon.com/event-driven-architecture/> |
| Thứ 3 | - Thiết kế luồng xử lý bất đồng bộ bằng **Amazon SQS** và **SNS** cho hệ thống đặt vé <br> - Tìm hiểu SQS Standard vs FIFO và SNS (topic, subscription) | 09/06/2026 | 09/06/2026 | <https://aws.amazon.com/sqs/> |
| Thứ 4 | - Tích hợp **SQS** làm hàng đợi xử lý request thanh toán <br> - Cấu hình **SNS** để gửi email xác nhận và vé điện tử cho khách hàng | 10/06/2026 | 10/06/2026 | <https://aws.amazon.com/sns/> |
| Thứ 5 | - Viết test script cho luồng xử lý bất đồng bộ <br> - Xử lý lỗi phát sinh khi truyền message qua SQS/SNS <br> - Cấu hình Dead Letter Queue (DLQ) để đảm bảo không mất message | 11/06/2026 | 11/06/2026 | <https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html> |
| Thứ 6 | - Ôn lại toàn bộ kiến trúc **SQS + SNS** đã tích hợp <br> - Viết kịch bản test kiểm thử luồng bất đồng bộ end-to-end | 12/06/2026 | 12/06/2026 | <https://aws.amazon.com/architecture/event-driven-architecture/> |
| Thứ 7 | - Thực hành cấu hình **SNS Topic** và **SQS Queue** trực tiếp trên AWS Console <br> - Chạy thử gửi message, kiểm tra nhận notification | 13/06/2026 | 13/06/2026 | <https://aws.amazon.com/sqs/> |

### Kết quả trong tuần:

Tuần này đã triển khai được một phần quan trọng của kiến trúc event-driven: luồng xử lý thanh toán bất đồng bộ với **SQS + SNS**. Đã biết cách chọn loại hàng đợi phù hợp và cấu hình **Dead Letter Queue** để tránh mất message.

Kết quả là đã chạy thử được luồng end-to-end trên Console, từ gửi message vào queue đến nhận notification. Điều này giúp hệ thống đặt vé hoạt động ổn định hơn khi có yêu cầu xử lý bất đồng bộ và thông báo khách hàng.
