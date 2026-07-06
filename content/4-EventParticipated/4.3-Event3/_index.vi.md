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

**Thực tế công việc DevOps rộng hơn rất nhiều:**
- Quản lý hạ tầng bằng **IaC** (Infrastructure as Code) — không click tay mà viết code cho hạ tầng
- Container và orchestration với **Docker / Kubernetes**
- Vận hành trên **cloud** — provisioning, cost management, scaling
- **Giám sát hệ thống**: log, metrics, alert, on-call
- Xử lý incident, quản lý phân quyền, làm rõ Ownership khi có vấn đề

**Học gì trước?** Đừng chạy theo tool — tool thay đổi liên tục. Nền tảng mới quan trọng: **Linux, Networking, Git, lập trình cơ bản**, và tư duy hệ thống.

**Bài học xương máu:**
- Copy lệnh từ StackOverflow mà không hiểu tại sao — là con đường dẫn đến rắc rối
- Luôn hỏi **"Tại sao"** trước khi hỏi **"Làm thế nào"**
- **Kỹ năng giao tiếp** là kỹ năng cốt lõi của DevOps, không phải phụ
- Dùng AI để học nhanh hơn, không phải để tắt não

---

### Anh Đạt & Anh Cường — Data Analytics & Văn hóa MNC

**Công việc của Data Analytics Engineer:**
Không phải chỉ vẽ biểu đồ đẹp — công việc thực tế xoay quanh:
- Xây dựng báo cáo và **dashboard** theo dõi chỉ số kinh doanh thực tế (như GMV, conversion rate)
- Phân tích và tìm **nguyên nhân gốc rễ** khi số liệu bất thường
- Đề xuất giải pháp cụ thể dựa trên dữ liệu, không phải cảm tính
- **Data Storytelling**: biết phân tích chưa đủ — phải biết kể câu chuyện từ dữ liệu để stakeholder hiểu và tin

**Thang 5 cấp độ trong sự nghiệp:**
Follower (thực thi) → Learner (học chủ động) → Problem Solver (tự giải quyết trọn vẹn) → System Thinker (nhìn bức tranh toàn cảnh, tối ưu dài hạn) → Super Star (định hướng chiến lược và dẫn dắt)

Hầu hết người mới vào là Follower. Bước nhảy lên **Problem Solver** — tự giải quyết trọn vẹn không cần hỏi từng bước — là bước quan trọng nhất để được tin tưởng giao việc lớn hơn.

**Văn hóa tại MNC công nghệ:**
- **No-Blame Post-Mortem**: khi có sự cố, không đi tìm người đổ lỗi — đi tìm nguyên nhân trong hệ thống để sửa. Đây là điểm khác biệt lớn giữa môi trường chuyên nghiệp và không chuyên nghiệp
- **Caring & Inclusive**: đặt con người làm trung tâm — không ai bị bỏ lại phía sau khi gặp khó khăn
- Triết lý **"Đúng Việc"**: 3 trụ cột — Làm Người (quản lý bản thân), Làm Nghề (phụng sự bằng chuyên môn), Làm Dân (trách nhiệm cộng đồng và quốc gia)

---

### Anh Danh — Từ First Cloud AI Journey đến AWS Partner

Anh Danh chia sẻ hành trình cá nhân theo **8 giai đoạn rõ ràng**, từ sinh viên tò mò đến trở thành AWS Partner và đóng góp lại cho cộng đồng:

**Giai đoạn 1–3 — Xây nền tảng:**
- Bắt đầu từ **sự tò mò** — không cần giỏi, chỉ cần bắt đầu
- Tìm **môi trường phù hợp** như First Cloud AI Journey để có định hướng đúng
- Học hỏi từ **cộng đồng và workshop** — đây là nguồn kiến thức thực tế nhất

**Giai đoạn 4–6 — Tích lũy thực chiến:**
- Thực hành qua các **hands-on labs** — đọc tài liệu chỉ là bước đầu, phải làm mới nhớ
- Áp dụng kiến thức vào **dự án thực tế tại trường** — đừng chờ đi làm mới bắt đầu build
- Xây dựng **portfolio** thể hiện năng lực — đây là thứ nhà tuyển dụng thực sự muốn thấy

**Giai đoạn 7–8 — Lan tỏa:**
- Trở thành **AWS Partner** — mở ra nhiều cơ hội hợp tác và dự án thực tế
- Thực hiện **"Share Back"** — giúp đỡ thế hệ đi sau, đây là giai đoạn ý nghĩa nhất

**Xu hướng thị trường:**
Anh Danh cũng chia sẻ biểu đồ nhu cầu tuyển dụng tại Việt Nam từ 2016–2025, cho thấy nhu cầu tăng mạnh đối với kỹ sư **AI/ML, Data và Cloud** — đây đang là 3 ngành hot nhất và sẽ còn tiếp tục trong nhiều năm tới.

**Quyền lợi khi tham gia cộng đồng AWS:**
Không chỉ là network — tham gia AWS Student Builder Group hay AWS Community Builder còn mang lại:
- **AWS Credits** để thực hành trên hạ tầng thật
- **Exam vouchers** để thi chứng chỉ với chi phí thấp hoặc miễn phí
- **Swag points** và các **badges** ghi nhận đóng góp
- Quan trọng hơn: gặp đúng người vào đúng lúc

---

## Điều mình mang về

Event 3 khác hai event trước — ít AI hơn, nhiều "thực tế nghề nghiệp" hơn. Những thứ đọng lại:

- **Lộ trình 8 giai đoạn** rất thực tế — mình đang ở giai đoạn 4–5, tức là đúng lúc cần tập trung build portfolio
- **Problem Solver** là cấp độ cần nhắm đến ngay — không hỏi từng bước nữa, tự xử lý trọn vẹn
- **Data Storytelling** không phải kỹ năng phụ — là thứ quyết định liệu phân tích của mình có được nghe hay không
- **DevOps là tư duy hệ thống**, không phải biết nhiều tool nhất
- **Cộng đồng là đầu tư dài hạn** — bắt đầu tham gia ngay từ bây giờ thay vì chờ "khi nào giỏi hơn"

#### Một số hình ảnh khi tham gia sự kiện

<div style="display:flex;flex-wrap:wrap;gap:12px;align-items:flex-start">
  <img src="/images/4-EventParticipated/4.3-Event3/02fd3145e69867c63e892.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/50400dfdda205b7e02317.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/7223549d8340021e5b5110.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/8319bea7697ae824b16b8.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/92acc71710ca9194c8db1.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/af6eaed3790ef850a11f5.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/dba02f1ef8c3799d20d26.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/ed911328c4f545ab1ce49.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725803084_7984502197d16c6294cc55c897dc18ea.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725807073_84fcd3d4313cc421e775a111f2eb946f.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725825478_5dd299fe7816c631ca7a99063a7e12a4.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725831126_11fc0329af32df5ae3a9a9df54015fa5.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725840272_557c064b17e7dec9f7e1ffe307fd9d44.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725852503_c480e27d65a8d82026ded60f6de5b737.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725858895_fa11f2e171ceb3cbad4d26b5d2009e91.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725873656_699c80fd49a8f98c5842b283eeb7f595.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725874996_9e7511356f7d8eec1fc7fe8fe9419f22.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725890856_d4b0b892b684f333ac8edb8f3b515c44.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725893603_65bef2a3fcd4f3079cac9e41366508e2.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
</div>
