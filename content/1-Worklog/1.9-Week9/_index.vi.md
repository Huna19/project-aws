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
| 2   | - Lên ý tưởng và thiết kế toàn diện **Architecture Diagram** cho hệ thống đặt vé **Flash Sale** <br> - Xác định các thành phần chính: **EC2**, **RDS**, **S3**, **SQS**, **SNS**, **CloudFront** | 15/06/2026   | 15/06/2026      | <https://aws.amazon.com/architecture/>    |
| 3   | - Quy hoạch mạng bảo mật **VPC**: thiết kế **Public/Private Subnet**, **Security Group**, **NAT Gateway** <br> - Thể hiện chi tiết luồng tích hợp **Amazon SQS** trên bản vẽ kiến trúc      | 16/06/2026   | 16/06/2026      | <https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html> |
| 4   | - Thể hiện chi tiết luồng tích hợp **Amazon SNS** trên bản vẽ kiến trúc để xử lý bất đồng bộ <br> - Hoàn thiện luồng: client → API → SQS → worker → SNS → thông báo khách hàng             | 17/06/2026   | 17/06/2026      | <https://aws.amazon.com/sns/>             |
| 5   | - Phân tích sự đánh đổi kỹ thuật: **EC2 + Auto Scaling** vs **AWS Lambda** <br> - Đánh giá cold start, giới hạn thời gian chạy, chi phí, khả năng kiểm soát                 | 18/06/2026   | 18/06/2026      | <https://aws.amazon.com/lambda/>          |
| 6   | - Chốt phương án thiết kế: sử dụng máy chủ **EC2** kết hợp **Auto Scaling** thay vì AWS Lambda <br> - Đảm bảo hiệu năng liên tục của hệ thống Flash Sale                                   | 19/06/2026   | 19/06/2026      | <https://aws.amazon.com/ec2/> |

### Kết quả đạt được tuần 9:

Tuần này đã hoàn thiện thiết kế kiến trúc tổng thể cho hệ thống Flash Sale, bao gồm sơ đồ dịch vụ và quy hoạch bảo mật **VPC**. Đã xác định rõ vai trò của **EC2**, **RDS**, **S3**, **SQS**, **SNS** và **CloudFront** trong giải pháp.

Kết quả là đã có một kiến trúc chi tiết cho cả luồng dữ liệu và luồng xử lý bất đồng bộ. Việc đánh giá **EC2 + Auto Scaling** so với **Lambda** giúp chốt phương án phù hợp cho hiệu năng liên tục và mở rộng khi tải cao.


