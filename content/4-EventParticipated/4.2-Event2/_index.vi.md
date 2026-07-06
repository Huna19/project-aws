---
title: "Event 2"
date: 2024-01-01
weight: 2
chapter: false
pre: " <b> 4.2. </b> "
---

# Bài thu hoạch — AWS Community Day (23/05/2026)

AWS Community Day diễn ra ngày 23/05/2026 với 6 chủ đề kỹ thuật chuyên sâu, trải dài từ AI/ML, Multi-Agent, CloudFront cho đến câu chuyện thực chiến từ hackathon.

---

## Diễn giả & Chủ đề

| Diễn giả | Chủ đề |
|---|---|
| Anh Tịnh | Build a Second Brain |
| Hải Anh | Friendly AI Assistant with Amazon Q |
| Thịnh | From Edge To Origin: CloudFront as Your Foundation |
| Team VIB | 36 hrs with LotusHacks – Building UTMorpho from Idea to Reality |
| Đào Đức | Deep Dive: How LLM Actually Works |
| Cát Vy | Enterprise-Grade Multi-Agent System: Startup Credit Scoring |

---

## Nội dung từng phần

### Anh Tịnh — Xây dựng Second Brain với AI

Anh Tịnh mở đầu bằng một thực tế mà ai cũng từng gặp: hỏi AI một câu, nhận về câu trả lời chung chung không dùng được. Lý do thường không phải AI kém — mà là đầu vào thiếu ngữ cảnh.

Bài nói giới thiệu cách thiết kế input cho AI như đang giao việc cho người, gồm 4 thành phần:
- **Goal** — mục tiêu cụ thể muốn đạt được
- **Relevant info** — thông tin thực sự liên quan, không phải tất cả mọi thứ
- **Constraints** — giới hạn, yêu cầu kỹ thuật hoặc ràng buộc
- **Success criteria** — tiêu chí để biết output có đúng không

Ngoài ra còn đề cập đến kiến trúc bộ nhớ cho AI: **Store → Retrieve → Generate → Learn** — cách một hệ thống AI hoàn chỉnh nên vận hành thay vì chỉ là chatbot một chiều.

---

### Hải Anh — Trợ lý AI Doanh nghiệp với Amazon Q

Hải Anh trình bày về việc doanh nghiệp đang gặp vấn đề gì khi vận hành: nhân viên lặp đi lặp lại các tác vụ thủ công, thông tin nằm rải rác khắp nơi, mất quá nhiều thời gian để từ dữ liệu đi đến quyết định.

**Amazon Q** và bộ Agentic AI được giới thiệu như giải pháp rút ngắn vòng lặp đó: kết nối trực tiếp với hơn 40 nguồn dữ liệu, tìm kiếm nội bộ, và thực hiện action thay vì chỉ trả lời câu hỏi. Điểm đáng chú ý là phần **Guardrails** — cơ chế kiểm soát để AI không làm những việc không được phép, đảm bảo tuân thủ quy định của doanh nghiệp.

---

### Thịnh — CloudFront từ Biên đến Nguồn

Phần này giải quyết một vấn đề rất thực tế mà startup hay gặp: **Bill Shock** — hóa đơn AWS bất ngờ tăng vọt do traffic đột biến hoặc bị tấn công DDoS.

Thịnh giới thiệu cách CloudFront không chỉ là CDN mà còn là lớp bảo vệ đầu tiên:
- Tích hợp **WAF** để chặn request độc hại trước khi chạm đến backend
- **Nén tự động** giảm 82% dung lượng và 81% độ trễ
- **HTTP/3 (QUIC)** cho phép tải song song nhiều file cùng lúc
- **Origin Cloaking** với OAC/Custom Headers để ẩn hoàn toàn origin server
- Gói **giá cố định** bao gồm CDN + WAF + Anti-DDoS giúp kiểm soát chi phí

---

### Team VIB — 36 Giờ tại LotusHacks

Team VIB kể lại hành trình xây dựng **UTMorpho** trong 36 giờ tại hackathon LotusHacks, sử dụng Claude Sonnet 4 trên US-East-1.

Phần thú vị nhất là những khó khăn thực tế họ gặp: AI liên tục sinh quá nhiều nội dung không cần thiết (AI Overgeneration), token limit bị chạm đúng lúc deadline căng thẳng nhất. Bài học cuối cùng họ rút ra: **"Real Frustration Creates Real Ideas"** — chính áp lực thực tế mới đẩy ra được ý tưởng tốt, và trong hackathon, sự đồng bộ của đội quan trọng hơn số lượng ý tưởng.

---

### Đào Đức — LLM Thực Sự Hoạt Động Thế Nào

Đây là phần kỹ thuật nhất của ngày. Đào Đức đập tan một lầm tưởng phổ biến: **Temperature = 0 không có nghĩa là output luôn giống nhau**.

Thực tế: độ chính xác vẫn dao động đến 15%, khoảng cách giữa lần chạy tốt nhất và tệ nhất có thể lên tới 70% dù dùng prompt giống hệt nhau. Nguyên nhân nằm ở cách GPU xử lý song song các phép toán dấu phẩy động — phép tính không có tính chất kết hợp, nên thứ tự xử lý ảnh hưởng đến kết quả.

Hướng giải quyết thực tế: thiết kế hệ thống **chịu đựng được sai số**, dùng **Majority Voting**, và không nên kỳ vọng AI cho ra output nhất quán tuyệt đối.

---

### Cát Vy — Multi-Agent Chấm Điểm Tín Dụng Startup

Đây là case study gây ấn tượng nhất. Cát Vy trình bày bài toán thực tế: startup bị ngân hàng từ chối vì không có báo cáo tài chính hay tài sản thế chấp theo chuẩn truyền thống.

Giải pháp là xây một **Ủy ban Tín dụng Ảo** gồm 6 agent chuyên biệt: Manager, Financial Analyst, Market Analyst, Team Evaluator, Risk Assessor và Compliance — mỗi agent xử lý một góc nhìn riêng, sau đó tổng hợp lại thành quyết định cuối.

Kết quả đo được rất thuyết phục:
- Thời gian xét duyệt: từ 2–3 tuần → còn 2–4 giờ
- Chi phí mỗi quyết định: từ ~100 triệu VND → dưới 5 triệu VND
- Tỷ lệ phê duyệt tăng lên 35–45%

Stack triển khai: Docker → Amazon ECR → Bedrock AgentCore Runtime → AWS Lambda → API Gateway.

---

## Điều mình mang về

Event 2 nặng kỹ thuật hơn Event 1 rất nhiều. Mỗi phần đều có thứ để áp dụng ngay:

- **Context engineering**: từ giờ viết prompt sẽ nghĩ đến Goal + Relevant info + Constraints + Success criteria
- **CloudFront**: đưa vào danh sách kiến trúc cần học thực hành, đặc biệt phần WAF + OAC
- **Multi-Agent**: thay vì một prompt dài để làm mọi thứ, nghĩ đến việc tách thành các agent nhỏ có trách nhiệm rõ ràng
- **LLM nondeterminism**: ngừng kỳ vọng AI trả về kết quả ổn định 100% — thiết kế hệ thống để xử lý được điều đó

#### Một số hình ảnh khi tham gia sự kiện

<div style="display:flex;flex-wrap:wrap;gap:10px;align-items:flex-start">
  height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/z7866450114341_f4f7bf1c450c1fbfc72d663d28be7689.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/z7866450150269_87bf550e28462644de70351a8524597e.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/z8012727405347_74ddedcf5bd410288321f619818306df.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/z8012727414598_5b95973bda3c8d9c72fdbc89eb5bd78d.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/z8012727420692_398410f9e2c81cb6375187bde10a7a43.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/z8013051068612_255e1ebc81570508ceeada2dfe8697ab.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/z8013051079376_a0aad7626d002edfd3fd04d548015aa1.jpg" style="width:220px;height:auto" />
</div>
