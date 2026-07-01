---
title: "Worklog Tuần 9"
date: 2024-01-01
weight: 9
chapter: false
pre: " <b> 1.9. </b> "
---
### Mục tiêu tuần 9:

* Lên ý tưởng và thiết kế toàn diện **sơ đồ kiến trúc hạ tầng đám mây** (Architecture Diagram) cho hệ thống đặt vé **Flash Sale**.
* Quy hoạch mạng bảo mật **VPC** và thể hiện chi tiết luồng tích hợp **Amazon SQS**, **SNS** trên bản vẽ kiến trúc.
* Phân tích sự đánh đổi kỹ thuật và chốt phương án thiết kế.

### Các công việc cần triển khai trong tuần này:
| Thứ | Công việc                                                                                                                                                                                   | Ngày bắt đầu | Ngày hoàn thành | Nguồn tài liệu                            |
| --- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ | --------------- | ----------------------------------------- |
| 2   | - Lên ý tưởng và thiết kế toàn diện **Architecture Diagram** cho hệ thống đặt vé **Flash Sale** <br> - Xác định các thành phần chính: **EC2**, **RDS**, **S3**, **SQS**, **SNS**, **CloudFront** | 15/06/2026   | 15/06/2026      |                                           |
| 3   | - Quy hoạch mạng bảo mật **VPC**: thiết kế **Public/Private Subnet**, **Security Group**, **NAT Gateway** <br> - Thể hiện chi tiết luồng tích hợp **Amazon SQS** trên bản vẽ kiến trúc      | 16/06/2026   | 16/06/2026      |                                           |
| 4   | - Thể hiện chi tiết luồng tích hợp **Amazon SNS** trên bản vẽ kiến trúc để xử lý bất đồng bộ <br> - Hoàn thiện luồng: client → API → SQS → worker → SNS → thông báo khách hàng             | 17/06/2026   | 17/06/2026      |                                           |
| 5   | - Phân tích sự đánh đổi kỹ thuật: **EC2 + Auto Scaling** vs **AWS Lambda** <br> - Đánh giá cold start, giới hạn thời gian chạy, chi phí, khả năng kiểm soát                 | 18/06/2026   | 18/06/2026      |                                           |
| 6   | - Chốt phương án thiết kế: sử dụng máy chủ **EC2** kết hợp **Auto Scaling** thay vì AWS Lambda <br> - Đảm bảo hiệu năng liên tục của hệ thống Flash Sale                                   | 19/06/2026   | 19/06/2026      |                                           |


### Kết quả đạt được tuần 9:

Tuần này mình tập trung hoàn toàn vào **thiết kế kiến trúc** — lên ý tưởng và vẽ toàn diện **Architecture Diagram** cho hệ thống đặt vé **Flash Sale**. Khác với mấy tuần trước chủ yếu code và thực hành, tuần này là nhìn tổng thể: dịch vụ nào nằm ở đâu, luồng dữ liệu chạy thế nào.

Phần quan trọng nhất là quy hoạch mạng bảo mật **VPC** (Public/Private Subnet, Security Group, NAT Gateway) và thể hiện chi tiết luồng tích hợp **Amazon SQS** + **SNS** trên bản vẽ: client → API → SQS queue → worker xử lý bất đồng bộ → SNS gửi thông báo cho khách. Nhìn trên sơ đồ thấy rõ hơn cách các dịch vụ kết nối với nhau.

Chỗ mình phân tích lâu nhất là sự đánh đổi kỹ thuật giữa **EC2 + Auto Scaling** và **AWS Lambda**. Lambda nhẹ, tự scale, nhưng cold start và giới hạn thời gian chạy (15 phút) không phù hợp cho hệ thống Flash Sale cần xử lý liên tục, ổn định. Cuối cùng chốt dùng **EC2 kết hợp Auto Scaling** — vừa đảm bảo hiệu năng liên tục, vừa tự động mở rộng khi lượng truy cập tăng đột biến.


