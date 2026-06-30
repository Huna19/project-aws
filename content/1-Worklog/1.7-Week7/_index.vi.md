---
title: "Worklog Tuần 7"
date: 2024-01-01
weight: 1
chapter: false
pre: " <b> 1.7. </b> "
---
### Mục tiêu tuần 7:

* Tự học lý thuyết về **Docker**: cấu trúc container, quản lý image, volume.
* Thực hành viết **Dockerfile** tối ưu để đóng gói ứng dụng backend cá nhân.
* Thực hành lab tổng hợp: kéo image từ **Docker Hub** về **EC2** và khởi chạy container.
* Nghiên cứu tích hợp **Cypress** vào luồng **CI/CD**.

### Các công việc cần triển khai trong tuần này:
| Thứ | Công việc                                                                                                                                                                                   | Ngày bắt đầu | Ngày hoàn thành | Nguồn tài liệu                            |
| --- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ | --------------- | ----------------------------------------- |
| 2   | - Tự học lý thuyết **Docker** cơ bản: cấu trúc container, so sánh với VM <br> - Tìm hiểu cách **Docker Engine** hoạt động <br> - Cài đặt Docker trên máy local                             | 01/06/2026   | 01/06/2026      |                                           |
| 3   | - Tìm hiểu quản lý **Docker Image**: build, tag, push/pull từ Docker Hub <br> - Tìm hiểu **Docker Volume**: cách mount dữ liệu, persist data giữa các container                            | 02/06/2026   | 02/06/2026      |                                           |
| 4   | - Thực hành viết **Dockerfile** tối ưu cho ứng dụng backend cá nhân <br> - Build và test container chạy trên máy local                                                                      | 03/06/2026   | 03/06/2026      |                                           |
| 5   | - Thực hành lab tổng hợp: kéo image từ **Docker Hub** về **EC2** và khởi chạy container <br> - So sánh cách deploy bằng PM2 (tuần 1–2) vs Docker container                                  | 04/06/2026   | 04/06/2026      |                                           |
| 6   | - Nghiên cứu phương pháp tích hợp công cụ kiểm thử **Cypress** vào luồng **CI/CD** <br> - Đảm bảo chất lượng ứng dụng Cloud qua automated testing                                          | 05/06/2026   | 05/06/2026      |                                           |


### Kết quả đạt được tuần 7:

Tuần này mình chuyển sang mảng mới: **Docker**. Trước giờ deploy backend lên EC2 toàn dùng **PM2** chạy trực tiếp (tuần 1–2), giờ học cách đóng gói vào container — gọn hơn, dễ quản lý hơn, và nhất quán giữa local với production.

Phần lý thuyết đi từ cơ bản: cấu trúc container, Docker Engine, quản lý image, volume. Đến giữa tuần mình viết **Dockerfile** tối ưu cho backend cá nhân rồi build + test trên local. Sau đó làm lab tổng hợp: kéo image từ **Docker Hub** về **EC2** và khởi chạy container — so với PM2 thì setup lần đầu lâu hơn nhưng về sau quản lý dễ hơn nhiều.

Cuối tuần mình nghiên cứu tích hợp **Cypress** vào luồng **CI/CD** để đảm bảo chất lượng ứng dụng Cloud. Chưa setup pipeline hoàn chỉnh nhưng hiểu được flow tổng thể: push code → build Docker → chạy test Cypress → deploy.


