---
title: "Event 2"
date: 2024-01-01
weight: 2
chapter: false
pre: " <b> 4.2. </b> "
---

# Ghi chép học hỏi "AWS Community Day (23/05/2026)"

### Trọng tâm của sự kiện

- Chuyển tải các bản cập nhật kỹ thuật sâu về các đổi mới AWS — đặc biệt là tiến bộ AI/ML, mô hình kiến trúc Multi-Agent và tối ưu chi phí hạ tầng.
- Tạo cơ hội networking để học hỏi trực tiếp từ các kỹ sư tại các doanh nghiệp lớn.
- Phân tích triển khai thực tế: hệ thống đánh giá rủi ro tín dụng, kiến trúc Second Brain và mô hình triển khai CloudFront.

### Bộ mặt diễn giả

- **Anh Tịnh**: Build second brain
- **Hải Anh**: Friendly AI Assistant with Amazon Q
- **Thịnh**: From Edge To Origin: CloudFront as Your Foundation
- **Team VIB**: 36 hrs with LotusHacks – Building UTMorpho from Idea to Reality
- **Đào Đức**: Deep dive talk: How LLM actually works
- **Cát Vy**: Enterprise-Grade Multi-Agent System: The Case of Startup Credit Scoring

### Các phiên chuyên sâu kỹ thuật

Sáu phiên với mật độ kỹ thuật cao lấp đầy lịch trình:

#### 1) Kiến trúc Ngữ cảnh & Thiết kế Second Brain (Anh Tịnh)

- **Tại sao AI hoạt động dưới mức**: Các câu trả lời kém thường bắt nguồn từ đầu vào thiếu ngữ cảnh phù hợp, không phải do model yếu.
- **Sai lầm "Ném hết vào chậu"**: Đổ toàn bộ tài liệu vào cửa sổ chat không chỉ làm giảm độ chính xác — mà còn lãng phí token.
- **Thiết kế Framework Ngữ cảnh**: Để coi AI như "bộ não thứ hai", cấu trúc đầu vào như việc giao việc cho người: Goal + Relevant info + Constraints + Success criteria.
- **Pipeline bộ nhớ**: Một hệ thống hoàn chỉnh chạy qua: Store → Retrieve → Generate → Learn.

#### 2) Trợ lý ảo Doanh nghiệp & Agentic AI (Hải Anh)

- **Vấn đề dữ liệu doanh nghiệp**: Các đội nhóm liên tục thực hiện các tác vụ thủ công tốn thời gian trong khi săn lùng thông tin phân mảnh.
- **Khả năng của Amazon Quick Suite**: Agentic AI hợp nhất trải nghiệm người dùng, tăng tốc chu trình từ Insight đến Action.
- **Bề mặt tích hợp**: Kết nối trực tiếp đến hơn 40 data connector, database nội bộ, tìm kiếm web và hàng nghìn action từ bên thứ ba.
- **Thực thi Responsible AI**: An toàn dữ liệu thông qua Governance, Access controls và Guardrails đáp ứng yêu cầu pháp lý.

#### 3) Tối ưu mạng biên thông qua Amazon CloudFront (Thịnh)

- **Kịch bản "Bill Shock"**: Giá Pay-as-you-go tạo rủi ro tài chính trong những đợt tăng lưu lượng hoặc tấn công — hóa đơn có thể chạm $100,000 ngoài dự tính.
- **Giải pháp gói giá cố định**: AWS đóng gói CDN, WAF, Anti-DDoS, Route 53 và S3 thành một gói giá cố định để dự đoán tài chính dễ dàng.
- **Hiệu năng nén tại biên**: Nén HTTP tự động giảm kích thước download 82% và độ trễ 81%. HTTP/3 (QUIC/UDP) cho phép multiplexing song song các tài sản tĩnh.
- **Chiến lược ẩn nguồn gốc**: Origin Access Control (OAC) hoặc Custom Headers hoàn toàn ẩn máy chủ gốc khỏi việc phơi bày trên internet công khai.

#### 4) Xây dựng trong 36 giờ tại LotusHacks (Team VIB)

- **Phát triển mẫu nhanh**: UTMorpho được thiết kế và triển khai trong 36 giờ sử dụng Claude Sonnet 4 trên US-East-1.
- **Rào cản kỹ thuật chính**: Đội gặp phải vấn đề "AI Overgeneration" và liên tục chạm ngưỡng Token Limits dưới áp lực deadline.
- **Bài học trọng yếu**: "Real Frustration Creates Real Ideas". Trong hackathon, Team Sync và sức bền vượt trội hơn số lượng ý tưởng.

#### 5) Tính bất định của LLM ở quy mô lớn (Đào Đức)

- **Ảo tưởng Temperature = 0**: Đặt T=0 lý thuyết nên tạo output giống hệt nhau. Thực tế, độ chính xác dao động 15%, và khoảng cách giữa lần chạy tốt/tệ nhất đạt 70% với prompt giống hệt.
- **Nguyên nhân kỹ thuật gốc rễ**: Các phép toán floating-point GPU song song thiếu tính kết hợp: (a+b)+c != a+(b+c). Thêm vào đó, Inference batching làm thay đổi tính toán cho từng request riêng lẻ.
- **Phương pháp giảm thiểu**: Xây hệ thống chịu lỗi, triển khai Majority voting và xem xét Temperature=0.1 để tránh vòng lặp từ vựng vô hạn.

#### 6) Kiến trúc Multi-Agent cấp doanh nghiệp (Cát Vy)

- **Giới hạn ngân hàng truyền thống & Single Agent**: Startup bị từ chối do thiếu báo cáo tài chính/tài sản thế chấp. Một AI Agent duy nhất gây ra giới hạn Context, pha loãng chuyên môn, thiếu Checks & Balances và tạo ra Single Point of Failure.
- **Thiết kế Ủy ban Tín dụng ảo**: Một tập hợp agent chuyên môn: Manager, Financial Analyst, Market Analyst, Team Evaluator, Risk Assessor và Compliance.
- **Tác động vận hành (ROI)**: Thời gian phê duyệt giảm từ 2-3 tuần xuống 2-4 giờ. Chi phí quyết định rơi từ ~100 triệu VND xuống dưới 5 triệu VND, trong khi tỷ lệ phê duyệt tăng gấp đôi lên 35-45%.
- **Stack triển khai**: Dockerized, đẩy lên Amazon ECR, tích hợp vào Bedrock AgentCore Runtime, kết nối qua AWS Lambda, phơi bày thông qua API Gateway.

### Nhận thức cốt lõi

- Nhận ra sự chuyển dịch mô hình từ AI đơn model sang kiến trúc Multi-Agent để giải quyết các vấn đề doanh nghiệp phức tạp, phân nhánh.
- Nhận thức sắc bén hơn về tầm quan trọng của Security & Compliance (Guardrails) khi triển khai AI lên Production.
- Hiểu được tối ưu độ trễ thông qua CloudFront và các mô hình tích hợp Amazon Q thực tế cho quy trình hàng ngày.
- Nắm được cơ bản về tính bất định LLM và nguyên tắc thiết kế chịu lỗi khi xây dựng hệ thống phụ thuộc AI.

### Ứng dụng dự kiến

- Khảo sát tích hợp **Amazon Q** cho quy trình debug và điều hướng tài liệu AWS để tiết kiệm thời gian.
- Kiến trúc mạng: Ưu tiên triển khai **CloudFront** ở biên kết hợp với WAF và OAC để tăng tốc tải trang, ẩn máy chủ gốc và thực thi bảo mật.
- Các thiết kế tính năng AI trong tương lai sẽ phân rã logic thành "Agent" chuyên môn thay vì nhồi nhét mọi thứ vào một prompt duy nhất.
- Xây dựng framework viết prompt xoay quanh 4 yếu tố: Goal, Relevant Info, Constraints, Success Criteria.

### Trải nghiệm phản hồi

Sự kiện này mang đến mật độ kỹ thuật cực kỳ cao. Trong khi Event 1 nghiêng về hướng dẫn nghề nghiệp và tối ưu prompt cơ bản, Event 2 nhảy thẳng vào kiến trúc hệ thống và cách các doanh nghiệp lớn triển khai AI an toàn và hiệu quả về chi phí. Case study chấm điểm tín dụng Multi-Agent của Cát Vy nổi bật vì vẽ rõ bức tranh AI cấp doanh nghiệp với những con số ROI thuyết phục. Vấn đề "Bill Shock" và giải pháp CloudFront cũng cung cấp một bài học vô cùng thực tế cho các dự án sắp tới.

#### Một số hình ảnh khi tham gia sự kiện
<div style="display:flex;flex-wrap:wrap;gap:10px;align-items:flex-start">
  <img src="/images/4-EventParticipated/4.2-Event2/0af18e585985d8db819420.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/1c14f9bc2e61af3ff67019.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/1f91f03f27e2a6bcfff326.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/235701fad62757790e3627.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/3dfd2c55fb887ad6239912.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/53ed98464f9bcec5978a14.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/5b603dceea136b4d320223.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/64fbaf53788ef9d0a09f21.jpg" style="width:220px;height:auto" />
  
</div>
