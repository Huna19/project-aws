---
title : "Tự động hóa triển khai"
date : 2024-01-01
weight : 8
chapter : false
pre : " <b> 5.8. </b> "
---

### Tự động hóa triển khai (CI/CD Pipeline)

Trong chương này, chúng ta sẽ thiết lập quy trình tích hợp và triển khai liên tục (CI/CD) cho cả **Backend API Server** và **Worker Server** thông qua các dịch vụ **AWS CodeCommit**, **AWS CodeBuild**, và **AWS CodePipeline**.

#### Các bước thực hiện:

1. **[CI/CD cho Backend API Server](5.8.1-backend/)**
   * Khởi tạo thông tin HTTPS Git Credentials cho IAM User.
   * Tạo Git Repository `ticket-app-backend` trên AWS CodeCommit.
   * Tạo CodeBuild project đóng gói code.
   * Thiết lập CodePipeline tự động kích hoạt deploy lên Beanstalk Backend khi push code mới.

2. **[CI/CD cho Worker Server](5.8.2-worker/)**
   * Tạo Git Repository `ticket-app-worker` trên AWS CodeCommit.
   * Tạo CodeBuild project và CodePipeline tự động deploy code lên Beanstalk Worker.
