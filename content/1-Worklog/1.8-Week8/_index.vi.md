---
title: "Worklog Tuần 8"
date: 2024-01-01
weight: 8
chapter: false
pre: " <b> 1.8. </b> "
---
### Mục tiêu tuần 8:

* Nghiên cứu kiến trúc **hướng sự kiện** và thiết kế luồng xử lý bất đồng bộ bằng **Amazon SQS**, **SNS**.
* Thực hành cấu hình SNS Topic và SQS Queue trên AWS Console.

### Các công việc cần triển khai trong tuần này:
| Thứ | Công việc                                                                                                                                                                                   | Ngày bắt đầu | Ngày hoàn thành | Nguồn tài liệu                            |
| --- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ | --------------- | ----------------------------------------- |
| 2   | - Nghiên cứu kiến trúc **hướng sự kiện** (Event-Driven Architecture) trên AWS <br> - Tìm hiểu tại sao cần xử lý bất đồng bộ, các pattern phổ biến                                          | 08/06/2026   | 08/06/2026      |                                           |
| 3   | - Thiết kế luồng xử lý bất đồng bộ bằng **Amazon SQS** và **SNS** phục vụ dự án đặt vé <br> - Tìm hiểu SQS (Standard vs FIFO) và SNS (topic, subscription)                                | 09/06/2026   | 09/06/2026      |                                           |
| 4   | - Tích hợp **SQS** làm hàng đợi xử lý request thanh toán <br> - Cấu hình **SNS** gửi email/tin nhắn xác nhận và vé điện tử cho khách hàng                                                 | 10/06/2026   | 10/06/2026      |                                           |
| 5   | - Viết test script cho luồng xử lý bất đồng bộ <br> - Xử lý các lỗi phát sinh khi truyền message qua SQS/SNS                                                                              | 11/06/2026   | 11/06/2026      |                                           |
| 6   | - Ôn tập lại kiến trúc SQS + SNS đã tích hợp <br> - Viết kịch bản test để kiểm thử luồng xử lý bất đồng bộ                                                                                                    | 12/06/2026   | 12/06/2026      |                                           |
| 7   | - Thực hành cấu hình **SNS Topic** và **SQS Queue** trực tiếp trên AWS Console <br> - Chạy thử nghiệm gửi message và nhận notification | 13/06/2026   | 13/06/2026      |                                           |


### Kết quả đạt được tuần 8:

Tuần này mình vừa làm kỹ thuật vừa học được nhiều về định hướng nghề nghiệp. Phần kỹ thuật: nghiên cứu **kiến trúc hướng sự kiện** và thiết kế luồng xử lý bất đồng bộ bằng **Amazon SQS** + **SNS** phục vụ dự án đặt vé — khi nhiều người đặt vé cùng lúc, request thanh toán đẩy vào **SQS queue** để worker xử lý, xong rồi **SNS** gửi email xác nhận + vé điện tử cho khách.

Điểm nhấn lớn nhất trong tuần là việc tự tay cấu hình thành công hệ thống **SQS** và **SNS** trên AWS Console. Việc cấu hình thực tế giúp mình hiểu rõ hơn về cơ chế truyền tải thông điệp, cũng như cách thiết lập Dead Letter Queue (DLQ) để đảm bảo không bị mất dữ liệu khi có lỗi xảy ra trong quá trình thanh toán vé.


