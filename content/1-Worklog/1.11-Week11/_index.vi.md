---
title: "Worklog Tuần 11"
date: 2024-01-01
weight: 11
chapter: false
pre: " <b> 1.11. </b> "
---
### Mục tiêu tuần 11:

* Hoàn thiện code Backend, triển khai lên **Elastic Beanstalk** và **S3 Frontend**.
* Xây dựng luồng tự động hóa CI/CD với **CodePipeline**.
* Thiết lập hệ thống giám sát **CloudWatch Alarms** và thực hiện Load Testing.

### Các công việc cần triển khai trong tuần này:
| Thứ | Công việc | Ngày bắt đầu | Ngày hoàn thành | Nguồn tài liệu |
| --- | --- | --- | --- | --- |
| 2 | - Deploy Backend và Worker lên **Elastic Beanstalk** <br> - Deploy Frontend lên **Amazon S3** <br> - Kiểm tra trạng thái môi trường và các kết nối dịch vụ | 29/06/2026 | 29/06/2026 | <https://aws.amazon.com/elasticbeanstalk/> |
| 3 | - Thiết lập luồng triển khai tự động với **CodePipeline** <br> - Kết nối repository, bước build và đích deploy | 30/06/2026 | 30/06/2026 | <https://aws.amazon.com/codepipeline/> |
| 4 | - Viết **Project Proposal** chi tiết kiến trúc, bản đồ dịch vụ và lộ trình triển khai <br> - Ghi lại các quyết định triển khai và mục tiêu dự án | 01/07/2026 | 01/07/2026 | <https://aws.amazon.com/architecture/> |
| 5 | - Cấu hình **CloudWatch Alarms** cho các chỉ số quan trọng: EC2/Beanstalk, RDS, độ sâu hàng đợi SQS, tỷ lệ lỗi <br> - Kiểm tra các quy tắc cảnh báo và kênh nhận thông báo | 02/07/2026 | 02/07/2026 | <https://aws.amazon.com/cloudwatch/> |
| 6 | - Thực hiện các kịch bản **load testing** cơ bản trên ứng dụng đã deploy <br> - Ghi lại kết quả hiệu năng và khắc phục sự cố trong quá trình triển khai hoặc tích hợp dịch vụ | 03/07/2026 | 03/07/2026 | <https://aws.amazon.com/architecture/performance/> |

### Kết quả đạt được tuần 11:

Tuần này hoàn tất giai đoạn triển khai ứng dụng. Backend và worker đã chạy trên **Elastic Beanstalk**, frontend được host trên **Amazon S3**.

Đã thiết lập thành công luồng tự động **CodePipeline** để deploy, đồng thời soạn thảo **Project Proposal** và tài liệu hướng dẫn End-to-End. Mình cũng cấu hình **CloudWatch Alarms** cho các dịch vụ chính và thực hiện kiểm thử tải ban đầu.

Kết quả là hệ thống đang chạy ổn định với quy trình deploy tự động và giám sát cơ bản, sẵn sàng cho bước bàn giao cuối cùng.
