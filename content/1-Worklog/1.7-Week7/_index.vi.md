---
title: "Worklog Tuần 7"
date: 2024-01-01
weight: 7
chapter: false
pre: " <b> 1.7. </b> "
---
### Mục tiêu tuần 7:

* Tự học lý thuyết về **AWS Elastic Beanstalk** (PaaS) thay cho EC2 thuần.
* Tìm hiểu quy trình tự động hóa triển khai với **CI/CD** trên AWS.
* Thực hành deploy ứng dụng Node.js cơ bản lên Elastic Beanstalk.

### Các công việc cần triển khai trong tuần này:
| Thứ | Công việc | Ngày bắt đầu | Ngày hoàn thành | Nguồn tài liệu |
| --- | --- | --- | --- | --- |
| 2 | - Tự học lý thuyết **AWS Elastic Beanstalk**: khái niệm môi trường, ứng dụng, cách Beanstalk quản lý tài nguyên tự động | 01/06/2026 | 01/06/2026 | |
| 3 | - So sánh cách deploy truyền thống bằng PM2 (tuần 1–2) vs sử dụng **Elastic Beanstalk** | 02/06/2026 | 02/06/2026 | |
| 4 | - Thực hành: Đóng gói và deploy một ứng dụng backend Node.js cơ bản lên Elastic Beanstalk | 03/06/2026 | 03/06/2026 | |
| 5 | - Tìm hiểu về công cụ CI/CD của AWS: **CodeCommit**, **CodeBuild**, **CodePipeline** | 04/06/2026 | 04/06/2026 | |
| 6 | - Nghiên cứu phương pháp tích hợp mã nguồn từ GitHub/CodeCommit qua CodePipeline để deploy tự động lên Beanstalk | 05/06/2026 | 05/06/2026 | |

### Kết quả đạt được tuần 7:

Tuần này mình chuyển sang mảng thực hành cấp cao hơn: **PaaS và CI/CD**. Trước giờ deploy backend lên EC2 toàn dùng **PM2** và phải tự cấu hình môi trường từng bước (tuần 1–2). Khi chuyển sang **AWS Elastic Beanstalk**, mọi thứ từ Load Balancer, Auto Scaling đến EC2 đều được tự động hóa (managed) — gọn hơn, dễ quản lý hơn, và an toàn hơn cho production.

Đến giữa tuần mình đã thử deploy thành công một backend Node.js cơ bản lên Beanstalk. Sau đó, mình bắt tay vào tìm hiểu hệ sinh thái CI/CD của AWS (**CodePipeline, CodeBuild**). So với việc copy code thủ công lên server, thiết lập một pipeline tự động (push code → tự động build → deploy lên Beanstalk) chuyên nghiệp hơn rất nhiều. Dù chưa setup pipeline hoàn chỉnh nhưng mình đã nắm được luồng tổng thể chuẩn bị cho dự án lớn.
