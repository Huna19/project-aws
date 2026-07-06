---
title: "Event 3"
date: 2024-01-01
weight: 3
chapter: false
pre: " <b> 4.3. </b> "
---

# Ghi chép từ "FCAJ Meetup (13/06/2026)"

### Sự kiện hướng đến điều gì

- Vẽ lên bức tranh thực tế, không che giấu về công việc hàng ngày của các Kỹ sư (DevOps, Data Analytics) tại các tập đoàn đa quốc gia, xóa tan những lầm tưởng phổ biến của sinh viên.
- Khám phá văn hóa doanh nghiệp, các tiêu chuẩn làm việc toàn cầu và lộ trình sự nghiệp bền vững từ giai đoạn mới vào nghề đến khi trở thành chuyên gia.
- Truyền cảm hứng cho người tham dự cách tận dụng cộng đồng công nghệ (AWS) như một bệ phóng sự nghiệp và nền tảng lan tỏa kiến thức.

### Diễn giả tham gia

- **Anh Trọng H. Trương** (DevOps Engineer @ Endava Vietnam): "What does a DevOps Engineer really do?"
- **Anh Đạt Phạm** (Data Analytics Engineer) & **Anh Cường Nguyễn** (Process Engineer): "Câu chuyện thực tế đến văn hóa tại tập đoàn đa quốc gia"
- **Anh Danh Hoàng Hiếu Nghị** (AI Engineer): "From First Cloud AI Journey to AWS Partner"
- **Đinh Trung Kiên & Nguyễn Minh Thọ**: "A scalable URL shortening service on AWS"

### Điểm nhấn từng phiên

Bốn phiên thực chiến cao độ tạo nên chương trình:

#### 1) Đinh Trung Kiên & Nguyễn Minh Thọ — Rút gọn URL mở rộng quy mô trên AWS

- **Mục tiêu thiết kế**: Không phải MVP mong manh — mà là dịch vụ rút gọn URL cấp sản xuất, xây dựng cho khả năng mở rộng, bảo mật và độ trễ thấp.
- **Bẫy của kiến trúc đơn giản**: Kiến trúc Frontend → Backend → Database cơ bản mắc phải SPOF, khó mở rộng ngang, độ trễ đọc cao và không có lớp bảo vệ biên.
- **Kiến trúc AWS được dùng**:
  - **Lớp Biên**: Amazon CloudFront + AWS WAF để chặn traffic xấu và phân phối nội dung tĩnh từ Amazon Amplify.
  - **Lớp Ứng dụng**: Backend container hóa trên Amazon ECS (Fargate) với Application Load Balancer điều phối traffic vào Private Subnet.
- **Dịch vụ Sinh Key (KGS)**: Một service chạy nền tạo sẵn các mã ngắn và đẩy vào hàng đợi Redis (`LPUSH`) — loại bỏ hoàn toàn độ trễ sinh mã on-demand.
- **Luồng Ghi**: Backend lấy mã có sẵn từ Redis (`RPOP`), ánh xạ đến URL gốc và ghi vào DynamoDB. Không có độ trễ sinh mã.
- **Luồng Đọc (Cache-aside)**: ElastiCache for Redis được kiểm tra trước. DynamoDB chỉ được truy vấn khi cache miss, giảm đáng kể tải cho database chính.

#### 2) Trọng H. Trương — Bản mô tả công việc DevOps thực sự

- **Lầm tưởng vs. Thực tế**: Hầu hết mọi người hình dung DevOps là CI/CD pipeline, lệnh Docker/K8s, hay "anh hùng server" lúc nửa đêm. Công việc thực tế rộng hơn nhiều: trực on-call, xử lý sự cố, quản lý phân quyền, phân tích chi phí và làm rõ quyền sở hữu.
- **Nên học gì trước**: Công cụ luôn tiến hóa — hãy đuổi theo Fundamentals: Linux, Networking, Git, Containers và một ngôn ngữ lập trình (Python/Golang).
- **Bài học từ thực chiến**: Copy-paste lệnh từ internet không đồng nghĩa với việc hiểu chúng. Luôn hỏi "Tại sao" trước "Làm thế nào". Giao tiếp là năng lực cốt lõi của DevOps. Hãy dùng AI để mài sắc kỹ năng — không phải để thay thế tư duy của mình.

#### 3) Đạt Phạm & Cường Nguyễn — Cuộc sống MNC, không lọc

- **Kỹ năng sống còn**: Ngoài kỹ năng kỹ thuật, môi trường MNC đòi hỏi Tư duy phản biện, Giao tiếp, Giải quyết vấn đề và "Kể chuyện với dữ liệu".
- **Thang sự nghiệp 5 cấp**: Follower (thực thi) → Learner (tự phát triển chủ động) → Problem Solver (giải quyết vấn đề từ đầu đến cuối) → System Thinker (nhìn bức tranh toàn cảnh, tối ưu dài hạn) → Super Star (định hướng chiến lược và dẫn dắt).
- **Văn hóa No-Blame Post-Mortem**: Khi có sự cố, MNC công nghệ tập trung tìm nguyên nhân gốc rễ để sửa hệ thống — không đổ lỗi cho cá nhân.
- **Triết lý "Đúng Việc"**: Ba trụ cột — Làm Người (quản lý bản thân), Làm Nghề (phụng sự bằng chuyên môn), Làm Dân (trách nhiệm quốc gia, di sản công nghệ).

#### 4) Danh Hoàng Hiếu Nghị — Từ sinh viên đến AWS Partner

- **Lộ trình 8 bước**: Tò mò của sinh viên → Môi trường phù hợp (First Cloud AI Journey) → Học qua thực hành (Hands-on Labs) → Thể hiện năng lực (Portfolio) → Trở thành AWS Partner → Đóng góp lại cộng đồng.
- **Tại sao cộng đồng quan trọng**: Có việc làm chỉ là điểm xuất phát. Tham gia tích cực cộng đồng (AWS Student Builder Group, AWS Community Builder) mở khóa mạng lưới mạnh mẽ và hỗ trợ thực tế: voucher thi chứng chỉ, AWS Credits và swag độc quyền.

### Nhận thức cốt lõi

- **Tín hiệu rõ ràng**: Công cụ thay đổi liên tục — Fundamentals vững chắc và System Thinking là thứ đưa kỹ sư đi đường dài.
- **Tư duy gia nhập MNC**: Chuyển từ "hoàn thành việc" sang "hoàn thành đúng chuẩn", kết hợp tinh thần No-Blame để cải tiến liên tục.
- **Giá trị của việc đóng góp ngược lại**: Chiều sâu kỹ thuật kết hợp hỗ trợ cộng đồng tạo ra một trong những bệ phóng sự nghiệp mạnh nhất hiện có.
- **Tư duy System Design**: Nội hóa Separation of Concerns (tách luồng Đọc/Ghi), Defense at the Edge (WAF/CloudFront) và Pre-computation over On-demand (tính toán sớm, không phải tại thời điểm request).

### Cách mình sẽ áp dụng những bài học này

- **Học có chủ đích**: Cai nghiện copy-paste. Khi dùng AI để sinh script hay cấu hình, tự ép bản thân phân tích và hiểu từng dòng thực sự làm gì.
- **Nâng cấp tư duy đồ án**: Áp dụng tư duy System Thinker cho dự án thực tập thay vì chỉ thực thi. Làm code hiệu năng, dự đoán điểm thất bại và rèn luyện báo cáo tiến độ rõ ràng.
- **Xây dựng thương hiệu cá nhân**: Chủ động tham gia AWS Student Builder Group để phát triển Portfolio chất lượng và hướng đến đóng góp cộng đồng theo thời gian.
- **Cache-aside trong thực tế**: Tích hợp Redis vào dự án cá nhân và đồ án để tối ưu thời gian phản hồi cho các API có tần suất đọc cao.
- **Tách rời khối lượng công việc nặng**: Chuyển các tác vụ tốn kém ra khỏi luồng thực thi chính bằng worker chạy nền, chuẩn bị sẵn dữ liệu để luồng chính phản hồi mượt mà.

#### Một số hình ảnh khi tham gia sự kiện
<div style="display:flex;flex-wrap:wrap;gap:10px;align-items:flex-start">
  <img src="/images/4-EventParticipated/4.3-Event3/02fd3145e69867c63e892.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/50400dfdda205b7e02317.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/7223549d8340021e5b5110.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/8319bea7697ae824b16b8.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/92acc71710ca9194c8db1.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/af6eaed3790ef850a11f5.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/dba02f1ef8c3799d20d26.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/ed911328c4f545ab1ce49.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725852503_c480e27d65a8d82026ded60f6de5b737.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725893603_65bef2a3fcd4f3079cac9e41366508e2.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725803084_7984502197d16c6294cc55c897dc18ea.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725825478_5dd299fe7816c631ca7a99063a7e12a4.jpg" style="width:220px;height:auto" />

</div>
