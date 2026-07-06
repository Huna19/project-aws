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
* Chạy lại **EC2 + PM2** và tạo thử một **Lambda** nhỏ để cảm nhận sự khác biệt của serverless.

### Công việc từng ngày:

| Ngày | Nội dung công việc | Ngày bắt đầu | Ngày hoàn thành | Tài liệu tham khảo |
| --- | --- | --- | --- | --- |
| Thứ 2 | - Tìm hiểu các dịch vụ compute trên AWS <br> - Tìm hiểu AWS Lambda và các use case của serverless | 27/04/2026 | 27/04/2026 | |
| Thứ 3 | - Tìm hiểu AWS Regions, Availability Zones và Edge Locations <br> - Phân biệt phạm vi hoạt động của dịch vụ Global vs Regional | 28/04/2026 | 28/04/2026 | |
| Thứ 4 | - Tìm hiểu các thành phần mạng: Subnet, Security Group, Network ACL <br> - Các cách kết nối khác vào AWS Cloud | 29/04/2026 | 29/04/2026 | |
| Thứ 5 | - Thực hành trên Console <br> - Chọn Region, làm quen với VPC và Subnet <br> - Cấu hình Security Group cơ bản cho EC2 <br> - Thực hành chuyển đổi giữa các Region | 30/04/2026 | 30/04/2026 | |
| Thứ 6 | - Bật lại **EC2 Ubuntu**, chạy app **Node.js** bằng **PM2** <br> - Tạo hàm **Lambda** đơn giản, gọi thử trên Console <br> - Kiểm tra log thực thi qua Amazon CloudWatch Logs | 01/05/2026 | 01/05/2026 | |

### Kết quả trong tuần:

Tuần này tìm hiểu thêm về compute, mở rộng toàn cầu và networking — các mảng kiến thức bắt đầu liên kết với nhau hơn: Lambda, container, các dịch vụ compute khác; sau đó Region, hạ tầng AWS; rồi VPC, Subnet, Security Group, NACL — từ đây không còn chỉ là lý thuyết mà gắn liền với màn hình Console thực tế.

Hai ngày cuối tuần chủ yếu là "mò tay": đi qua Region, VPC/Subnet, Security Group; bật lại **EC2 Ubuntu**, chạy **Node.js** bằng **PM2** như tuần 1, rồi tạo thêm một **Lambda** nhỏ để thấy sự khác biệt giữa máy ảo luôn chạy và serverless. Không làm lab lớn — đây là tuần củng cố kiến thức là chính.
