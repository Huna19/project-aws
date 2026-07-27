---
title: "Worklog Tuần 4"
date: 2024-01-01
weight: 4
chapter: false
pre: " <b> 1.4. </b> "
---

### Mục tiêu tuần này:

* Nắm vững **IAM** — cách quản lý quyền truy cập tài nguyên AWS.
* Tìm hiểu các lớp **bảo mật** cơ bản trên AWS.
* Thực hành phân quyền và cấu hình Security Group trực tiếp trên Console.

### Công việc từng ngày:

| Ngày | Nội dung công việc | Ngày bắt đầu | Ngày hoàn thành | Tài liệu tham khảo |
| --- | --- | --- | --- | --- |
| Thứ 2 | - Tìm hiểu **IAM**: User, Group, Role, Policy <br> - Hiểu cách IAM kiểm soát quyền truy cập vào từng dịch vụ AWS <br> - Nguyên tắc Least Privilege | 11/05/2026 | 11/05/2026 | <https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html> |
| Thứ 3 | - Tìm hiểu các lớp bảo mật trên AWS: Security Group, NACL, VPC flow logs <br> - Phân biệt Security Group (stateful) vs NACL (stateless) | 12/05/2026 | 12/05/2026 | <https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Security.html> |
| Thứ 4 | - Thực hành IAM trên Console <br> - Tạo IAM User, gắn Policy, kiểm tra quyền truy cập <br> - Xem khuyến nghị bảo mật tài khoản (MFA, root account) | 13/05/2026 | 13/05/2026 | <https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html> |
| Thứ 5 | - Tìm hiểu thêm về **AWS Organizations** và quản lý nhiều tài khoản <br> - Tìm hiểu **CloudTrail** để ghi lại hoạt động trong tài khoản AWS | 14/05/2026 | 14/05/2026 | <https://aws.amazon.com/organizations/> |
| Thứ 6 | - Thực hành Security Group: mở EC2 trên Console <br> - Xem và chỉnh sửa rule inbound/outbound (SSH, HTTP, HTTPS) <br> - Áp dụng nguyên tắc Least Privilege vào cấu hình thực tế | 15/05/2026 | 15/05/2026 | <https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html> |

### Kết quả trong tuần:

Tuần này đã xây dựng được nền tảng bảo mật AWS: nắm rõ **IAM**, **Security Group**, **NACL**, và nguyên tắc **Least Privilege**. Đã thực hành tạo IAM User, gắn Policy, và kiểm tra quyền truy cập trên Console.

Kết quả là phân biệt rõ ràng giữa **Security Group (stateful)** và **NACL (stateless)**, đồng thời biết cách sử dụng **CloudTrail** để theo dõi hoạt động tài khoản. Đây là bước quan trọng để vận hành AWS an toàn hơn.
