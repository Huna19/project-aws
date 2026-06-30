---
title: "Worklog Tuần 8"
date: 2024-01-01
weight: 1
chapter: false
pre: " <b> 1.8. </b> "
---
### Mục tiêu tuần 8:

* Nghiên cứu kiến trúc **hướng sự kiện** và thiết kế luồng xử lý bất đồng bộ bằng **Amazon SQS**, **SNS**.
* Tham dự **FCAJ Meetup** (13/06) và tìm hiểu bức tranh thực tế về nghề DevOps, Data Analytics.
* Đúc kết lộ trình phát triển sự nghiệp và văn hóa doanh nghiệp chuẩn toàn cầu.

### Các công việc cần triển khai trong tuần này:
| Thứ | Công việc                                                                                                                                                                                   | Ngày bắt đầu | Ngày hoàn thành | Nguồn tài liệu                            |
| --- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ | --------------- | ----------------------------------------- |
| 2   | - Nghiên cứu kiến trúc **hướng sự kiện** (Event-Driven Architecture) trên AWS <br> - Tìm hiểu tại sao cần xử lý bất đồng bộ, các pattern phổ biến                                          | 08/06/2026   | 08/06/2026      |                                           |
| 3   | - Thiết kế luồng xử lý bất đồng bộ bằng **Amazon SQS** và **SNS** phục vụ dự án đặt vé <br> - Tìm hiểu SQS (Standard vs FIFO) và SNS (topic, subscription)                                | 09/06/2026   | 09/06/2026      |                                           |
| 4   | - Tích hợp **SQS** làm hàng đợi xử lý request thanh toán <br> - Cấu hình **SNS** gửi email/tin nhắn xác nhận và vé điện tử cho khách hàng                                                 | 10/06/2026   | 10/06/2026      |                                           |
| 5   | - Viết test script cho luồng xử lý bất đồng bộ <br> - Xử lý các lỗi phát sinh khi truyền message qua SQS/SNS                                                                              | 11/06/2026   | 11/06/2026      |                                           |
| 6   | - Ôn tập lại kiến trúc SQS + SNS đã tích hợp <br> - Chuẩn bị cho FCAJ Meetup cuối tuần                                                                                                    | 12/06/2026   | 12/06/2026      |                                           |
| 7   | - Tham dự **FCAJ Meetup** (13/06): <br> - Tìm hiểu bức tranh thực tế về nghề **DevOps**, **Data Analytics** tại các tập đoàn đa quốc gia (MNC) <br> - Lộ trình phát triển cùng cộng đồng AWS <br> - Đúc kết **5 giai đoạn phát triển sự nghiệp** (từ Follower đến System Thinker) <br> - Tiêu chuẩn khắt khe trong chuỗi cung ứng số: **ISO 27001**, **SOC 2** <br> - Văn hóa doanh nghiệp chuẩn toàn cầu: "**No-Blame**", "**Caring & Inclusive**" <br> - Triết lý "**Đúng việc**" (Làm người, Làm nghề, Làm dân) | 13/06/2026   | 13/06/2026      |                                           |


### Kết quả đạt được tuần 8:

Tuần này mình vừa làm kỹ thuật vừa học được nhiều về định hướng nghề nghiệp. Phần kỹ thuật: nghiên cứu **kiến trúc hướng sự kiện** và thiết kế luồng xử lý bất đồng bộ bằng **Amazon SQS** + **SNS** phục vụ dự án đặt vé — khi nhiều người đặt vé cùng lúc, request thanh toán đẩy vào **SQS queue** để worker xử lý, xong rồi **SNS** gửi email xác nhận + vé điện tử cho khách.

Điểm nhấn lớn nhất là **tham dự FCAJ Meetup ngày 13/06** — được nghe chia sẻ về bức tranh thực tế nghề **DevOps**, **Data Analytics** tại các tập đoàn đa quốc gia (MNC) và lộ trình phát triển cùng cộng đồng AWS. Mình đúc kết được **5 giai đoạn phát triển sự nghiệp** (từ Follower đến System Thinker) và hiểu thêm về các tiêu chuẩn khắt khe trong chuỗi cung ứng số như **ISO 27001**, **SOC 2**.

Phần ấn tượng nhất là học hỏi văn hóa doanh nghiệp chuẩn toàn cầu: "**No-Blame**", "**Caring & Inclusive**" cùng triết lý "**Đúng việc**" (Làm người, Làm nghề, Làm dân) — giúp định hình tư duy làm việc chuyên nghiệp, không chỉ giỏi kỹ thuật mà còn cần có mindset đúng.


