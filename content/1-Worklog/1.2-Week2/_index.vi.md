---
title: "Worklog Tuần 2"
date: 2024-01-01
weight: 2
chapter: false
pre: " <b> 1.2. </b> "
---

### Mục tiêu tuần này:

* Tìm hiểu thêm về compute, networking và các dịch vụ AWS cơ bản.
* Lên Console khám phá **Region**, **VPC**, **Security Group** cho quen tay.
* Tạo thử một **Lambda** nhỏ để cảm nhận sự khác biệt giữa serverless và máy ảo truyền thống.

### Công việc từng ngày:

| Ngày | Nội dung công việc | Ngày bắt đầu | Ngày hoàn thành | Tài liệu tham khảo |
| --- | --- | --- | --- | --- |
| Thứ 2 | - Tìm hiểu các dịch vụ compute trên AWS <br> - Tìm hiểu AWS Lambda và các use case của serverless | 27/04/2026 | 27/04/2026 | <https://aws.amazon.com/lambda/> |
| Thứ 3 | - Tìm hiểu AWS Regions, Availability Zones và Edge Locations <br> - Phân biệt phạm vi hoạt động của dịch vụ Global vs Regional | 28/04/2026 | 28/04/2026 | <https://aws.amazon.com/about-aws/global-infrastructure/> |
| Thứ 4 | - Tìm hiểu các thành phần mạng: Subnet, Security Group, Network ACL <br> - Các cách kết nối khác vào AWS Cloud | 29/04/2026 | 29/04/2026 | <https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html> |
| Thứ 5 | - Thực hành trên Console <br> - Chọn Region, làm quen với VPC và Subnet <br> - Cấu hình Security Group cơ bản cho EC2 <br> - Thực hành chuyển đổi giữa các Region | 30/04/2026 | 30/04/2026 | <https://docs.aws.amazon.com/vpc/latest/userguide/working-with-vpcs.html> |
| Thứ 6 | - Tạo hàm **Lambda** đơn giản, gọi thử trên Console <br> - Kiểm tra log thực thi qua Amazon **CloudWatch Logs** <br> - So sánh trải nghiệm giữa Lambda (serverless) và EC2 (luôn chạy) đã làm tuần trước | 01/05/2026 | 01/05/2026 | <https://docs.aws.amazon.com/lambda/latest/dg/lambda-monitoring.html> |

### Kết quả trong tuần:

Tuần này đã mở rộng kiến thức về **compute**, **Region/AZ**, và **mạng AWS**. Đã thực hành trên Console với **VPC**, **Subnet**, **Security Group** và hiểu được sự khác biệt giữa các thành phần mạng.

Cuối tuần tạo thành công một hàm **Lambda** và kiểm tra log bằng **CloudWatch Logs**, nhờ đó so sánh rõ ràng giữa kiến trúc serverless và EC2. Điều này giúp hình dung được khi nào nên dùng Lambda và khi nào cần dùng instance cố định.
