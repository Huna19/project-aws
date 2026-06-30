---
title : "Dọn dẹp tài nguyên"
date : 2024-01-01
weight : 9
chapter : false
pre : " <b> 5.9. </b> "
---

### Dọn dẹp tài nguyên (Resource Cleanup)

{{% notice warning %}}
Để tránh phát sinh các chi phí ngoài ý muốn trên tài khoản AWS cá nhân của bạn, hãy thực hiện dọn dẹp toàn bộ tài nguyên theo hướng dẫn dưới đây ngay sau khi hoàn thành bài lab thực hành.
{{% /notice %}}

---

#### 1. Dọn dẹp các tài nguyên triển khai thủ công

Thực hiện xóa các tài nguyên theo trình tự từ trên xuống dưới:

1. **Xóa môi trường Elastic Beanstalk**:
   * Mở [Elastic Beanstalk console](https://us-east-1.console.aws.amazon.com/elasticbeanstalk/home?region=us-east-1#/environments).
   * Chọn môi trường ```ticket-app-Backend-env``` -> click **Actions** -> chọn **Terminate environment**.
   * Thực hiện tương tự để Terminate môi trường ```ticket-app-Worker-env```.
   * Chờ cho đến khi quá trình hủy môi trường hoàn tất, sau đó xóa Application: Quay lại trang **Applications** -> chọn ```ticket-app-App``` -> click **Actions** -> **Delete application**.

2. **Xóa RDS Proxy & RDS PostgreSQL**:
   * Mở [Amazon RDS console](https://us-east-1.console.aws.amazon.com/rds/home?region=us-east-1#databases:).
   * Chọn **Proxies** -> Chọn ```rds-proxy-ticket-app``` -> click **Actions** -> **Delete**.
   * Chọn **Databases** -> Chọn Database instance ```database-ticket-app``` -> click **Actions** -> **Delete**:
     * Chọn **No** ở mục tạo final snapshot (để xóa nhanh không cần sao lưu).
     * Tích chọn xác nhận và nhập ```delete me``` để đồng ý xóa.

3. **Xóa ElastiCache Redis replication group**:
   * Mở [ElastiCache console](https://us-east-1.console.aws.amazon.com/elasticache/home?region=us-east-1#/clusters).
   * Chọn cụm Redis ```ticket-app-redis``` -> click **Actions** -> **Delete**.

4. **Xóa Cognito User Pool**:
   * Mở [Amazon Cognito console](https://us-east-1.console.aws.amazon.com/cognito/v2/home?region=us-east-1#).
   * Chọn User Pool ```ticket-app-user-pool``` -> click **Delete user pool**.

5. **Xóa AWS CodePipeline, CodeBuild & CodeCommit**:
   * Mở **CodePipeline console**:
     * Chọn các pipeline ```ticket-app-backend-pipeline``` và ```ticket-app-worker-pipeline``` -> click **Delete**.
   * Mở **CodeBuild console**:
     * Chọn các project ```ticket-app-backend-build``` và ```ticket-app-worker-build``` -> click **Delete**.
   * Mở **CodeCommit console**:
     * Chọn các repository ```ticket-app-backend``` và ```ticket-app-worker``` -> click **Delete**.

6. **Xóa Amazon SQS & SNS**:
   * Mở [Amazon SQS console](https://us-east-1.console.aws.amazon.com/sqs/v2/home?region=us-east-1#/queues).
   * Chọn `booking-queue.fifo` và `checkout-dlq.fifo` -> click **Delete**.
   * Mở [Amazon SNS console](https://us-east-1.console.aws.amazon.com/sns/v3/home?region=us-east-1#/topics) -> Chọn các Topic -> click **Delete**.

7. **Xóa S3 Buckets**:
   * Mở [Amazon S3 console](https://s3.console.aws.amazon.com/s3/home?region=us-east-1#).
   * Bạn phải **Empty** (xóa sạch file) trong bucket trước khi có thể xóa bucket:
     * Chọn Frontend Bucket ```frontend-ticket-app-app-<your-account-id>``` -> click **Empty** -> nhập `permanently delete` để xác nhận.
     * Sau khi empty xong, chọn Bucket -> click **Delete** -> nhập tên bucket để xác nhận xóa hẳn.

---

#### 2. Xóa CloudFormation Stack (Nếu có dùng)

Nếu bạn deploy toàn bộ hạ tầng cơ bản thông qua file template CloudFormation:

1. Mở [AWS CloudFormation console](https://us-east-1.console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks).
2. Chọn Stack của bạn (ví dụ: `ticket-app-stack`).
3. Click **Delete** ở thanh công cụ phía trên.
4. Xác nhận **Delete stack**.

![CloudFormation Delete](/images/5-Workshop/5.9-Cleanup/cf_delete.png)

5. Hệ thống sẽ tự động giải phóng toàn bộ tài nguyên mạng (VPC, Subnets, NAT Gateways, Security Groups...) một cách an toàn và sạch sẽ.
