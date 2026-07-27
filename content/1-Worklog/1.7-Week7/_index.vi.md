---
title: "Worklog Tuần 7"
date: 2024-01-01
weight: 7
chapter: false
pre: " <b> 1.7. </b> "
---

### Mục tiêu tuần này:

* Tìm hiểu **AWS Elastic Beanstalk** (PaaS) như là một lựa chọn thay thế cho EC2 thuần.
* Nắm quy trình tự động hóa triển khai với **CI/CD** trên AWS.
* Deploy thành công một app Node.js lên Beanstalk và khám phá bộ công cụ CI/CD.

### Công việc từng ngày:

| Ngày | Nội dung công việc | Ngày bắt đầu | Ngày hoàn thành | Tài liệu tham khảo |
| --- | --- | --- | --- | --- |
| Thứ 2 | - Tự học lý thuyết **AWS Elastic Beanstalk**: khái niệm environment, application, cách Beanstalk tự quản lý tài nguyên phía sau | 01/06/2026 | 01/06/2026 | <https://aws.amazon.com/elasticbeanstalk/> |
| Thứ 3 | - So sánh cách deploy truyền thống bằng PM2 (tuần 1–2) với **Elastic Beanstalk** <br> - Ghi chú những gì Beanstalk tự xử lý vs những gì vẫn là trách nhiệm của developer | 02/06/2026 | 02/06/2026 | |
| Thứ 4 | - Thực hành: Đóng gói và deploy backend **Node.js** cơ bản lên Elastic Beanstalk <br> - Xác nhận app chạy được qua URL của Beanstalk environment | 03/06/2026 | 03/06/2026 | <https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_nodejs_express.html> |
| Thứ 5 | - Tìm hiểu bộ công cụ CI/CD của AWS: **CodeCommit**, **CodeBuild**, **CodePipeline** <br> - Hiểu vai trò của từng công cụ trong pipeline tự động hóa | 04/06/2026 | 04/06/2026 | <https://aws.amazon.com/codepipeline/> |
| Thứ 6 | - Nghiên cứu cách kết nối mã nguồn (GitHub/CodeCommit) với **CodePipeline** để deploy tự động lên Beanstalk <br> - Vẽ ra luồng pipeline đầy đủ: push code → build → deploy | 05/06/2026 | 05/06/2026 | |

### Kết quả trong tuần:

Tuần này đã chuyển từ deploy thủ công sang deploy tự động trên **Elastic Beanstalk**. Đã hiểu rõ lợi thế của PaaS so với quản lý EC2 thủ công: giảm bớt cấu hình hạ tầng, tập trung vào code.

Đã triển khai thành công app **Node.js** lên Beanstalk và nghiên cứu hệ thống **CI/CD** với **CodePipeline**. Kết quả là đã xây dựng được nền tảng triển khai tự động cho dự án, thay vì phải cập nhật tay từng lần.
