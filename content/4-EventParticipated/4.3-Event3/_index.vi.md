---
title: "Event 3"
date: 2024-01-01
weight: 3
chapter: false
pre: " <b> 4.3. </b> "
---

# Bài thu hoạch — FCAJ Meetup (13/06/2026)

FCAJ Meetup ngày 13/06/2026 mang đến 4 bài nói thực chiến về nghề kỹ sư, văn hóa doanh nghiệp và kiến trúc hệ thống trên AWS — phần lớn từ những người đang làm việc thực tế trong ngành.

---

## Diễn giả & Chủ đề

| Diễn giả | Chủ đề |
|---|---|
| Đinh Trung Kiên & Nguyễn Minh Thọ | Dịch vụ rút gọn URL mở rộng quy mô trên AWS |
| Anh Trọng H. Trương (DevOps @ Endava) | DevOps Engineer thực sự làm gì? |
| Anh Đạt Phạm & Anh Cường Nguyễn | Câu chuyện thực tế & Văn hóa MNC |
| Anh Danh Hoàng Hiếu Nghị (AI Engineer) | Từ First Cloud AI Journey đến AWS Partner |

---

## Nội dung từng phần

### Đinh Trung Kiên & Nguyễn Minh Thọ — Rút gọn URL chuẩn production trên AWS

Hai bạn trình bày cách giải quyết bài toán System Design kinh điển — không phải làm cho xong, mà làm cho đúng chuẩn production: có khả năng mở rộng, bảo mật và độ trễ thấp.

**Vấn đề với kiến trúc đơn giản:**
Frontend → Backend → Database trực tiếp có quá nhiều điểm yếu: Single Point of Failure, khó scale, độ trễ cao, không có lớp bảo vệ trước tấn công.

**Kiến trúc thực tế họ xây:**
- **Lớp biên**: CloudFront + WAF chặn traffic xấu, Amplify phục vụ static content
- **Lớp ứng dụng**: ECS Fargate + ALB điều phối vào Private Subnet

**Điểm thú vị nhất — Key Generation Service:**
Thay vì sinh mã ngắn lúc request đến (on-demand), một service chạy nền liên tục tạo sẵn key và đẩy vào Redis queue (`LPUSH`). Khi có request, backend chỉ cần `RPOP` lấy key ra dùng — không có độ trễ sinh mã.

**Luồng đọc dùng Cache-aside**: ElastiCache Redis được kiểm tra trước, chỉ fallback xuống DynamoDB khi cache miss — giảm tải đáng kể cho database.

---

### Anh Trọng — DevOps Engineer thực sự làm gì?

Anh Trọng bắt đầu bằng cách liệt kê những gì mọi người thường nghĩ DevOps là: viết CI/CD, gõ lệnh Docker/K8s, "anh hùng sửa server lúc 2 giờ sáng". Rồi so sánh với thực tế.

Công việc DevOps thực tế xoay quanh hệ thống nhiều hơn code: trực on-call, xử lý incident, quản lý phân quyền, điều tra chi phí, làm rõ ai chịu trách nhiệm cái gì (Ownership).

**Học gì trước?** Đừng chạy theo tool — tool thay đổi liên tục. Nền tảng mới quan trọng: **Linux, Networking, Git, Containers**, và một ngôn ngữ lập trình (Python hoặc Golang).

**Bài học xương máu:**
- Copy lệnh từ StackOverflow mà không hiểu tại sao — là con đường dẫn đến rắc rối
- Luôn hỏi **"Tại sao"** trước khi hỏi **"Làm thế nào"**
- Giao tiếp là kỹ năng cốt lõi, không phải phụ
- Dùng AI để học nhanh hơn, không phải để tắt não

---

### Anh Đạt & Anh Cường — Cuộc sống thực tế trong MNC

Hai anh chia sẻ không che giấu về những gì thực sự xảy ra khi làm việc ở tập đoàn đa quốc gia.

**Kỹ năng sống còn ngoài kỹ thuật:**
Tư duy phản biện, kỹ năng giao tiếp, giải quyết vấn đề — và đặc biệt là khả năng **kể chuyện với dữ liệu** (Data Storytelling). Biết phân tích chưa đủ — phải biết trình bày để người khác hiểu và tin.

**Thang 5 cấp độ trong sự nghiệp:**
Follower → Learner → Problem Solver → System Thinker → Super Star

Hầu hết người mới vào là Follower. Bước nhảy lên Problem Solver (tự giải quyết trọn vẹn, không cần hỏi từng bước) là bước quan trọng nhất để được tin tưởng giao việc lớn hơn.

**Văn hóa No-Blame Post-Mortem:**
Khi có sự cố, không đi tìm người đổ lỗi — đi tìm nguyên nhân trong hệ thống để sửa. Đây là điểm khác biệt lớn giữa MNC chuẩn và môi trường thiếu chuyên nghiệp.

---

### Anh Danh — Từ First Cloud AI Journey đến AWS Partner

Anh Danh chia sẻ hành trình cá nhân theo 8 bước, từ sinh viên tò mò đến trở thành AWS Partner và đóng góp lại cho cộng đồng.

Điểm nhấn không phải ở các bước kỹ thuật — mà ở cách anh nhìn nhận **cộng đồng như một tài sản dài hạn**: có việc làm chỉ là bắt đầu, tham gia AWS Student Builder Group hay AWS Community Builder mang lại network, voucher thi chứng chỉ, AWS Credits, và quan trọng hơn là cơ hội gặp đúng người vào đúng lúc.

---

## Điều mình mang về

Event 3 khác hai event trước — ít AI hơn, nhiều "thực tế nghề nghiệp" hơn. Những thứ đọng lại:

- **System Design có thể học được** — bài URL shortener cho thấy cách tư duy từ MVP mỏng manh lên production-grade có quy trình rõ ràng
- **DevOps không phải là tool** — là tư duy và khả năng làm chủ hệ thống
- **Cấp độ Problem Solver** là mục tiêu ngắn hạn cần nhắm đến — không hỏi từng bước nữa, tự giải quyết trọn vẹn
- **Cộng đồng là đầu tư dài hạn** — bắt đầu tham gia ngay từ bây giờ thay vì chờ "khi nào giỏi hơn"

#### Một số hình ảnh khi tham gia sự kiện

<div style="display:flex;flex-wrap:wrap;gap:10px;align-items:flex-start">
  <img src="/images/4-EventParticipated/4.3-Event3/02fd3145e69867c63e892.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/7223549d8340021e5b5110.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/92acc71710ca9194c8db1.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725803084_7984502197d16c6294cc55c897dc18ea.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725807073_84fcd3d4313cc421e775a111f2eb946f.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725825478_5dd299fe7816c631ca7a99063a7e12a4.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725831126_11fc0329af32df5ae3a9a9df54015fa5.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725840272_557c064b17e7dec9f7e1ffe307fd9d44.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725852503_c480e27d65a8d82026ded60f6de5b737.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725858895_fa11f2e171ceb3cbad4d26b5d2009e91.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725873656_699c80fd49a8f98c5842b283eeb7f595.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725874996_9e7511356f7d8eec1fc7fe8fe9419f22.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725890856_d4b0b892b684f333ac8edb8f3b515c44.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725893603_65bef2a3fcd4f3079cac9e41366508e2.jpg" style="width:220px;height:auto" />
</div>
