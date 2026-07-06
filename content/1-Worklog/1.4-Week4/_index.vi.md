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
| Thứ 2 | - Tìm hiểu **IAM**: User, Group, Role, Policy <br> - Hiểu cách IAM kiểm soát quyền truy cập vào từng dịch vụ AWS <br> - Nguyên tắc Least Privilege | 11/05/2026 | 11/05/2026 | |
| Thứ 3 | - Tìm hiểu các lớp bảo mật trên AWS: Security Group, NACL, VPC flow logs <br> - Phân biệt Security Group (stateful) vs NACL (stateless) | 12/05/2026 | 12/05/2026 | |
| Thứ 4 | - Thực hành IAM trên Console <br> - Tạo IAM User, gắn Policy, kiểm tra quyền truy cập <br> - Xem khuyến nghị bảo mật tài khoản (MFA, root account) | 13/05/2026 | 13/05/2026 | |
| Thứ 5 | - Tìm hiểu thêm về **AWS Organizations** và quản lý nhiều tài khoản <br> - Tìm hiểu **CloudTrail** để ghi lại hoạt động trong tài khoản AWS | 14/05/2026 | 14/05/2026 | |
| Thứ 6 | - Thực hành Security Group: mở EC2 trên Console <br> - Xem và chỉnh sửa rule inbound/outbound (SSH, HTTP, HTTPS) <br> - Áp dụng nguyên tắc Least Privilege vào cấu hình thực tế | 15/05/2026 | 15/05/2026 | |

### Kết quả trong tuần:

Tuần này tập trung hoàn toàn vào **IAM và bảo mật** — hai mảng mà nhiều người hay bỏ qua khi mới học cloud nhưng lại cực kỳ quan trọng trong thực tế. IAM không chỉ là "tạo user" — nó là nền tảng kiểm soát ai được làm gì trên toàn bộ hạ tầng.

Phần dễ nhầm nhất là phân biệt **Security Group** (hoạt động ở mức instance, stateful — chỉ cần cho phép inbound thì outbound tương ứng tự được phép) với **NACL** (hoạt động ở mức subnet, stateless — phải tự khai báo cả chiều vào lẫn chiều ra). Sau khi thực hành trực tiếp trên Console thì sự khác biệt mới thực sự rõ.

Việc tìm hiểu thêm **CloudTrail** cũng hữu ích — trong môi trường production, biết ai đã làm gì, lúc nào là thứ không thể thiếu khi có sự cố.
