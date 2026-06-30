---
title : "Triển khai Beanstalk Backend & Worker"
date : 2024-01-01
weight : 2
chapter : false
pre : " <b> 5.5.2. </b> "
---

### Triển khai máy chủ Elastic Beanstalk

Trong phần này, chúng ta sẽ triển khai máy chủ API Backend và máy chủ Worker ngầm bằng **AWS Elastic Beanstalk** và cấu hình các biến môi trường để hệ thống hoạt động.

---

#### 1. Triển khai Beanstalk Backend (Web Server Environment)

1. Mở [AWS Elastic Beanstalk console](https://us-east-1.console.aws.amazon.com/elasticbeanstalk/home?region=us-east-1#/applications).
2. Click **Create application**.
3. Cấu hình ban đầu:
   * **Application name**: Nhập ```ticket-app-App```.
   * **Platform**: Chọn **Node.js**.
   * **Platform branch**: Chọn **Node.js 20 running on 64bit Amazon Linux 2023**.
   * **Application code**: Chọn **Sample application**.
   * Click **Next**.

![EB Platform](/images/5-Workshop/5.5-Application-Messaging/eb_platform.png)

4. Cấu hình **Service Access**:
   * **Service role**: Chọn **Use an existing service role** (chọn role mặc định của Beanstalk) hoặc để hệ thống tự tạo mới.
   * **EC2 instance profile**: Chọn Role Instance Profile đã có sẵn (đảm bảo role này được gán các quyền SQS, RDS, và Secrets Manager).
   * Click **Next**.
5. Cấu hình **Networking**:
   * **VPC**: Chọn VPC ```ticket-app-vpc```.
   * **Instance subnets**: Tích chọn hai **Private Subnets** (chỉ cho phép EC2 chạy ẩn bên trong mạng private).
   * **Load balancer subnets**: Tích chọn hai **Public Subnets** (để Load Balancer có IP public tiếp nhận request).
   * Click **Next**.
6. Cấu hình **Instances & Auto Scaling**:
   * **Environment type**: Chọn **Load balanced**.
   * **Instances**: t3.micro.
   * **Auto Scaling Group**: Min: ```2```, Max: ```4```.
   * **Scaling triggers**: Metric chọn ```CPUUtilization``` (Upper: ```70%```, Lower: ```30%```).
   * Click **Next** -> **Next** -> click **Submit** để khởi tạo môi trường.
   * Môi trường sau khi tạo sẽ có tên: ```ticket-app-Backend-env```.

![EB Application and Environment](/images/5-Workshop/5.5-Application-Messaging/beanstalk_environments.png)

---

#### 2. Triển khai Beanstalk Worker (Web Server Environment)

{{% notice important %}}
Lưu ý quan trọng: Beanstalk Worker Environment trong dự án này thực chất là một tiến trình Node.js chủ động pull tin nhắn từ SQS qua SDK. Do đó, chúng ta vẫn triển khai nó dưới dạng **Web server environment** (Load balanced) tương tự Backend chứ không dùng loại Worker Environment đặc thù của Beanstalk.
{{% /notice %}}

1. Quay lại trang ứng dụng Elastic Beanstalk ```ticket-app-App```.
2. Click **Create new environment** (góc trên bên phải).
3. **Environment tier**: Chọn **Web server environment**.
4. **Environment name**: Đặt tên ```ticket-app-Worker-env```.
5. Platform cấu hình tương tự Node.js 20.
6. Cấu hình **Service Access**, **Networking**, **Instances & Auto Scaling** y hệt như bước cấu hình Backend ở trên:
   * **VPC**: ```ticket-app-vpc```.
   * **Instance subnets**: Tích chọn hai **Private Subnets**.
   * **Load balancer subnets**: Tích chọn hai **Public Subnets** (Mặc dù chạy worker, Load Balancer vẫn được cấu hình để định tuyến và kiểm tra Health Check nội bộ).
7. Click **Submit** để khởi tạo môi trường.

---

#### 3. Cấu hình Environment Properties (Biến môi trường) trên Beanstalk

Để cả Backend và Worker có thể hoạt động và kết nối được với Database, Cache, SQS, và Cognito, bạn cần cấu hình các biến môi trường trực tiếp trên Beanstalk Console cho từng môi trường:

1. **Cấu hình cho Backend (```ticket-app-Backend-env```)**:
   * Vào chi tiết môi trường ```ticket-app-Backend-env``` -> chọn **Configuration** ở menu trái.
   * Tìm mục **Updates, monitoring, and logging** -> click **Edit**.
   * Cuộn xuống mục **Environment properties** ở cuối trang và nhập các biến sau:
     * ```PORT```: ```8080```
     * ```AWS_REGION```: ```us-east-1```
     * ```DB_HOST```: *(Nhập Proxy endpoint của RDS Proxy - xem chương 5.6)*
     * ```DB_PORT```: ```5432```
     * ```DB_NAME```: ```ticketdb```
     * ```DB_USER```: ```postgres```
     * ```DB_PASSWORD```: ```TicketingAppPassword2026!```
     * ```REDIS_HOST```: *(Nhập Primary endpoint của Redis - xem chương 5.6)*
     * ```REDIS_PORT```: ```6379```
     * ```SQS_BOOKING_QUEUE_URL```: ```https://sqs.us-east-1.amazonaws.com/<your-account-id>/booking-queue.fifo```
     * ```COGNITO_USER_POOL_ID```: *(Xem chương 5.7)*
     * ```COGNITO_CLIENT_ID```: *(Xem chương 5.7)*
     * ```CLOUDFRONT_DOMAIN```: ```https://<your-cloudfront-domain>.cloudfront.net```
     * ```MOMO_PARTNER_CODE```: ```MOMO```
     * ```MOMO_ACCESS_KEY```: ```F8BBA842ECF85```
     * ```MOMO_SECRET_KEY```: ```K951B6PE1waDMi640xX08PD3vg6EkVlz```
     * ```MOMO_ENDPOINT```: ```https://test-payment.momo.vn/v2/gateway/api```
     * ```RESERVATION_TIMEOUT_MINUTES```: ```15```
   * Click **Apply** và đợi môi trường cập nhật lại cấu hình.

![Backend Environment Properties](/images/5-Workshop/5.5-Application-Messaging/backend_properties.png)

2. **Cấu hình cho Worker (```ticket-app-Worker-env```)**:
   * Thực hiện các bước tương tự cho môi trường ```ticket-app-Worker-env``` với các biến môi trường tương tự để Worker có thể kết nối với Database, Redis và đọc tin nhắn từ SQS.

![Worker Environment Properties](/images/5-Workshop/5.5-Application-Messaging/worker_properties.png)
