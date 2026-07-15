---
title: "Event 2"
date: 2024-01-01
weight: 2
chapter: false
pre: " <b> 4.2. </b> "
---

# Báo cáo thu hoạch: Workshop GenAI-powered App-DB Modernization & AWS Community Day (23/05/2026)

AWS Community Day diễn ra ngày 23/05/2026 với 6 chuyên đề kỹ thuật chuyên sâu, xoay quanh việc ứng dụng AI/LLM trong thực tế, tối ưu hóa hạ tầng AWS và những bài học xương máu từ hackathon.

---

## Mục đích của sự kiện

- Chia sẻ giải pháp thực tế và best practices trong việc ứng dụng AI/LLM và tối ưu hóa hạ tầng cloud (AWS).
- Giới thiệu các mô hình kiến trúc AI tiên tiến: Multi-Agent Systems, Context Engineering, AI Assistants.
- Hướng dẫn tối ưu chi phí, tăng bảo mật và nâng cao hiệu năng vận hành từ Edge đến Origin.
- Chia sẻ kinh nghiệm thực tế và bài học xương máu từ các dự án Hackathon dưới áp lực lớn.

---

## Diễn giả & Chủ đề

| Diễn giả | Chức danh | Chủ đề |
|---|---|---|
| Vy Lam (Cát Vy) | Senior BSA @ VPBank | Enterprise-Grade Multi-Agent System |
| Đức Đào | Solution Architect @ Cloud Kinetics | How LLM Actually Works |
| Team VIB | Đội UTMorpho @ Lotus Hacks | 36 giờ Hackathon |
| Hải Anh | AWS Community Builder @ G-AsiaPacific | Friendly AI Assistant with Amazon Q |
| Tuấn Thịnh | DevOps Engineer | CloudFront as Your Foundation |
| Tịnh Trương | Platform Engineer @ GoTymeX | Context Engineering |

---

## Nội dung từng phần

### Cát Vy — Hệ thống Multi-Agent cấp Doanh nghiệp

**Bài toán gốc rễ:**
Hệ thống chấm điểm tín dụng ngân hàng truyền thống yêu cầu dữ liệu tài chính 3 năm và tài sản thế chấp — hoàn toàn không phù hợp với startup chỉ có dữ liệu vận hành 6–18 tháng, tài sản là IP và con người, dữ liệu phi cấu trúc.

**Giải pháp: Mô hình Hội đồng Tín dụng Ảo**
Thay vì dùng 1 Agent duy nhất dễ bị loãng ngữ cảnh, hệ thống phân rã thành nhiều Agent chuyên hóa kết nối qua giao thức **MCP**:
- **Financial Analyst** — phân tích tài chính
- **Market Analyst** — đánh giá thị trường
- **Team Evaluator** — đánh giá đội ngũ
- **Risk Assessor** — định lượng rủi ro
- **Compliance** — kiểm tra tuân thủ pháp lý
- **Manager** — tổng hợp và ra quyết định cuối

**ROI vượt trội:**
- Thời gian xử lý hồ sơ: từ 2–3 tuần → còn 2–4 giờ (nhanh hơn 95%)
- Chi phí vận hành giảm hơn 90%
- Tỷ lệ phê duyệt tăng lên 35–45%

**Bảo mật cấp doanh nghiệp:**
Triển khai qua **Bedrock AgentCore** + **Terraform**, bắt buộc có **Guardrails** để bảo vệ dữ liệu nhạy cảm (PII) và chặn Prompt Injection.

---

### Đức Đào — Bản chất không định hình của LLM ở Temperature = 0

**Lầm tưởng phổ biến:**
Người dùng thường nghĩ đặt T=0 (Greedy Decoding) thì AI sẽ luôn trả về kết quả giống nhau 100% cho cùng một câu lệnh.

**Thực tế nghiên cứu:**
Không có mô hình lớn nào (GPT-4o, Llama-3, Mixtral...) định hình tuyệt đối ở T=0. Nguyên nhân do:
- Kiến trúc phần cứng GPU xử lý song song
- Sai số toán học số **dấu phẩy động (floating-point)** — phép tính không có tính kết hợp: (a+b)+c ≠ a+(b+c)
- Các thuật toán tối ưu hóa suy luận (Inference batching) thay đổi tính toán theo từng batch

**Hậu quả & Giải pháp:**
- T=0 dễ làm mô hình bị kẹt vào **vòng lặp phản hồi vô hạn**
- Giải pháp: đặt **T=0.1** tạo một cú hích ngẫu nhiên nhỏ để thoát lặp
- Kết hợp tăng **repeat penalty** và thiết kế hệ thống **chấp nhận tính xác suất**
- Bắt buộc đầu ra có cấu trúc (**JSON/YAML**) bằng tham số hệ thống, không chỉ dùng prompt

---

### Team VIB — 36 Giờ tại Lotus Hacks 2026

**Hành trình từ số 0:**
Tham gia Lotus Hacks 2026 (hackathon lớn nhất Việt Nam) với bàn tay trắng, tìm kiếm ý tưởng từ chính những "nỗi đau" trong công việc hàng ngày để khai sinh ra **UTMorpho** — chạy trên Claude Sonnet 4, region US-East-1.

**Thách thức thực tế trong 36 giờ:**
- Áp lực thời gian nghẹt thở liên tục
- Hiện tượng **AI Overgeneration** — AI sinh quá nhiều nội dung không cần thiết
- Liên tục chạm ngưỡng **Token Limits** đúng lúc deadline gần nhất
- **Burnout** của các thành viên ngay trước giờ Pitch

**Bước ngoặt:**
Tập trung vào **Focused Editing Experience** (tối ưu trải nghiệm chỉnh sửa) và sự **đồng bộ, đồng lòng của toàn đội** (Team Sync) là hai yếu tố quyết định thành bại — quan trọng hơn số lượng ý tưởng.

Bài học: **"Real Frustration Creates Real Ideas"** — nỗi bực bội thực tế tạo ra ý tưởng sản phẩm tốt nhất.

---

### Hải Anh — Trợ lý AI thân thiện với Amazon Q

**Nỗi đau của Business User:**
- Mất quá nhiều thời gian thu thập thông tin từ nhiều nguồn phân tán
- Tốn sức cho các tác vụ lặp đi lặp lại
- Phụ thuộc chuyên gia khi cần phân tích dữ liệu chuyên sâu

**Giải pháp Amazon Q Suite:**
Không gian hợp nhất cho con người và AI Agent cộng tác:
- Kết nối hơn **40 nguồn dữ liệu** (data connectors)
- Tích hợp các mô hình **Bedrock** và file người dùng
- Chuyển hóa nhanh nhất từ "nhận thức" (Insight) sang "hành động" (Action)
- Kiểm soát bằng **Governance, Access controls và Guardrails** tuân thủ pháp lý

**Ứng dụng thực tế — PM Assistant:**
Tự động hóa hoàn toàn:  
Biên bản cuộc họp (MoM) → Tự động gửi email cho stakeholders → Tự động lên lịch cuộc họp tiếp theo

---

### Tuấn Thịnh — Tối ưu hạ tầng mạng với CloudFront

**Nỗi sợ hóa đơn cloud:**
Với mô hình Usage-based billing, các startup lo lắng chi phí tăng vọt do lưu lượng biến động hoặc bị tấn công DDoS.

**Giải pháp: Gói cước cố định (Fixed-Price Plans):**
CloudFront cung cấp các gói tháng cố định (Free, Pro, Business, Premium):
- **Không phí vượt hạn mức**
- **Lưu lượng từ tấn công bị chặn sẽ không bị tính tiền**

**Tối ưu hiệu năng vượt trội:**
- Hơn **700 PoPs toàn cầu** + kết nối bền vững giảm CPU máy chủ gốc EC2 từ **5% → 1%**
- **HTTP/3 multiplexing** cho phép tải tài nguyên song song
- Nén dữ liệu giảm thời gian phản hồi tới **81%** (từ 123ms → 24ms)
- **Origin Cloaking** với OAC/Custom Headers ẩn hoàn toàn origin server

---

### Tịnh Trương — Kỹ nghệ ngữ cảnh: Context Is Everything

**Thông điệp cốt lõi:**
Mô hình AI hiện nay rất mạnh. Kết quả tệ hay chung chung phần lớn là do **ngữ cảnh đầu vào quá yếu**, không phải do mô hình kém.

**3 sai lầm kinh điển khi dùng AI:**

1. **"The Internet Puller"** — Nhồi nhét quá nhiều tài liệu không lọc vào chat, làm loãng thông tin và tốn token

2. **Nói điều hiển nhiên** — Đưa cho AI đoạn code có sẵn rồi ra lệnh cấu hình lại chính công nghệ đó, thay vì tập trung vào logic cần sửa

3. **Thiếu mục tiêu và ràng buộc** — Yêu cầu mơ hồ khiến AI phải tự đoán mò

**Khung ngữ cảnh chuẩn (Simple Context Framework):**
Trước khi viết bất kỳ prompt nào, chuẩn bị đủ 4 yếu tố:
- **Goal** — Mục tiêu cụ thể muốn đạt được
- **Relevant info** — Thông tin thực sự liên quan
- **Constraints** — Ràng buộc, giới hạn kỹ thuật
- **Success criteria** — Tiêu chí để biết output có đúng không

---

## Những gì học được

**Tư duy thiết kế & phát triển ứng dụng:**
- **Business-First Approach**: Ý tưởng sản phẩm tốt nhất luôn bắt đầu từ bài toán thực tế trong vận hành, không phải từ việc chạy theo công nghệ
- **Context Engineering là kỹ năng cốt lõi**: Tương lai không phải Người vs AI, mà là Người biết dùng AI vs Người không biết. Sự dịch chuyển đang đi từ Prompt → Context Systems → Memory dài hạn
- **Multi-Agent thinking**: Với bài toán doanh nghiệp phức tạp, nhiều Agent chuyên hóa phối hợp mang lại độ chính xác và ROI vượt trội so với một Agent đơn lẻ

**Kiến trúc kỹ thuật & vận hành:**
- **Probabilistic Mindset**: Khi xây dựng ứng dụng LLM, phải thiết kế để chấp nhận đầu ra có biến động — ngay cả ở T=0. Cần kiểm tra phía sau và kiểm thử liên tục
- **Edge Computing**: Dùng CloudFront Function hoặc Lambda@Edge để xử lý logic ngay tại vùng biên, giảm tải tối đa cho máy chủ gốc

---

## Ứng dụng vào công việc

- **Prompt hàng ngày**: Áp dụng ngay Simple Context Framework (Goal → Relevant info → Constraints → Success criteria) vào mọi tương tác với AI
- **Thiết kế AI Agent**: Chuyển từ đơn lẻ sang kiến trúc phân rã nhiệm vụ cho nhiều Agent chuyên trách, cấu hình T=0.1 tránh lặp vô hạn
- **Thử nghiệm Amazon Q + MCP**: Khám phá tích hợp để tự động hóa quy trình lặp (biên bản họp, báo cáo tự động)
- **Hạ tầng web**: Đề xuất cấu hình CloudFront + Origin Cloaking cho các dự án web, dùng gói cước cố định để kiểm soát chi phí

---

## Cảm nhận sau sự kiện

Đây là một trong những buổi event kỹ thuật chất lượng nhất mình từng tham gia. Không phải kiểu "nghe cho biết" — mà là những người đang làm thực tế chia sẻ bài toán thực, giải pháp thực và cả thất bại thực.

Ấn tượng nhất là sự đối lập giữa hai bài: Cát Vy với ROI 95% của hệ thống Multi-Agent được tính toán cẩn thận, và Team VIB với 36 giờ hỗn loạn nhưng đầy cảm xúc. Cả hai đều dạy những thứ khác nhau mà không có tài liệu nào viết được.

#### Một số hình ảnh khi tham gia sự kiện

<div style="display:flex;flex-wrap:wrap;gap:12px;align-items:flex-start">
 <img src="/images/4-EventParticipated/4.2-Event2/z7866450137122_fa7ac674224cf3e8b1fe76ae81263462.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.2-Event2/z8012727405347_74ddedcf5bd410288321f619818306df.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.2-Event2/z8012727414598_5b95973bda3c8d9c72fdbc89eb5bd78d.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.2-Event2/z8013051079376_a0aad7626d002edfd3fd04d548015aa1.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
</div>
