---
title: "Event 1"
date: 2024-01-01
weight: 1
chapter: false
pre: " <b> 4.1. </b> "
---

# Báo cáo thu hoạch: AWS Cloud & DevOps Meetup & Workshop (09/05/2026)

Buổi event diễn ra vào ngày 09/05/2026 tại văn phòng AWS, quy tụ 4 diễn giả với các chủ đề xoay quanh học tập, AI và định hướng nghề nghiệp cho người mới. Đây là buổi chia sẻ nội bộ dành cho các bạn đang tham gia chương trình First Cloud AI Journey, với không khí khá thoải mái và gần gũi.

---

## Diễn giả & Chủ đề

| Diễn giả | Chủ đề |
|---|---|
| Anh Long | Làm sao để nghiện học như nghiện mạng xã hội |
| Thịnh | Automated Prompt Engineering |
| Anh Khang | Sao chưa đi làm? / AI-Ready Fresher |
| Thư | Giới thiệu BMAD |

---

## Nội dung từng phần

### Anh Long — Nghiện học như nghiện mạng xã hội

Điểm xuất phát của bài nói là câu hỏi rất thực tế: tại sao biết học là quan trọng nhưng vẫn cứ cầm điện thoại lên? Thay vì trả lời theo kiểu "hãy cố gắng hơn", anh Long tiếp cận từ góc độ sinh học thần kinh — cách não bộ thực sự đưa ra quyết định.

**Tại sao não chọn mạng xã hội thay vì học?**

Não bộ không phân biệt "tốt hay xấu" — nó chỉ chạy theo phần thưởng. Mạng xã hội được thiết kế cực kỳ tinh vi để khai thác điều đó:
- Phần thưởng **tức thời**: like, comment, notification — không cần chờ đợi
- Nội dung **luôn mới**: mỗi lần scroll là một bất ngờ, não tiết dopamine liên tục
- **Không cần nỗ lực**: chỉ cần ngón tay cái, không cần tư duy

Học thì ngược lại hoàn toàn: kết quả chậm, đòi hỏi tập trung cao, không có phản hồi ngay lập tức. Đó là lý do tại sao ý chí luôn thua.

**Giải pháp: thiết kế lại môi trường học**

Thay vì chiến đấu với não bộ, anh Long đề xuất "đánh lừa" nó bằng cách tái thiết kế môi trường:

- **Chia nhỏ task**: chia việc cần làm xuống đến mức nhỏ đến nỗi không có lý do gì để trì hoãn nữa. Thay vì "học AWS hôm nay", đổi thành "đọc 1 trang tài liệu về EC2"
- **Quy tắc 2 phút**: bất kỳ việc nào dưới 2 phút — làm ngay, không lên lịch, không nghĩ thêm. Đây là cách chống trì hoãn hiệu quả nhất với những task nhỏ
- **Ghi nhận tiến bộ nhỏ**: não cần được "thưởng" để tiếp tục. Tick off một task dù nhỏ cũng tạo ra cảm giác thỏa mãn thực sự
- **Đặt trigger đúng chỗ**: thay vì học ở chỗ bạn hay scroll mạng, thay đổi môi trường — học ở bàn làm việc, tắt thông báo, đặt tài liệu học ngay chỗ mắt nhìn đầu tiên

**Biến kiến thức thành dopamine gamble**

Một trong những điểm thú vị nhất: anh Long giải thích khái niệm *variable reward* — phần thưởng không đoán trước được kích thích dopamine mạnh hơn phần thưởng cố định. Đó là lý do tại sao slot machine gây nghiện hơn tiền lương cố định. Nếu biến việc học thành dạng "không biết mình sẽ khám phá được gì hôm nay", não sẽ bắt đầu chờ đợi nó như chờ notification.

---

### Thịnh — Automated Prompt Engineering

Phần này đi vào vấn đề kỹ thuật hơn hẳn. Thịnh mở đầu bằng một nhận xét thẳng: hầu hết mọi người viết prompt giống như nhắn tin cho bạn bè — mơ hồ, thiếu context, rồi ngạc nhiên khi AI trả lời không đúng ý. Sau đó, thay vì sửa prompt, họ cứ thêm thông tin vào mà không có cấu trúc.

**Prompt kém = kết quả kém + tốn tiền**

Một điểm quan trọng mà nhiều người không để ý: mỗi token trong prompt đều tốn tiền. Một prompt phình to, nhồi nhét thông tin dư thừa không chỉ cho ra kết quả kém hơn mà còn làm tăng chi phí vận hành. Với các hệ thống production gọi API hàng nghìn lần mỗi ngày, đây là con số rất đáng kể.

**Automated Prompt Engineering là gì?**

Thay vì tự tay viết lại prompt qua nhiều lần thử sai, có thể dùng AI để:
1. Sinh ra nhiều biến thể prompt từ cùng một yêu cầu
2. Chạy thử và đánh giá từng biến thể
3. Chọn ra phiên bản hoạt động tốt nhất theo tiêu chí đã định trước

Cách tiếp cận này biến việc tối ưu prompt từ nghệ thuật chủ quan thành một quy trình có thể đo lường và lặp lại.

**Cấu trúc một prompt tốt**

Thịnh cũng chia sẻ framework viết prompt gồm các thành phần: Role (AI đóng vai gì), Task (nhiệm vụ cụ thể), Context (ngữ cảnh cần biết), Input (dữ liệu đầu vào), Example (ví dụ mong muốn), Output (định dạng output), Constraints (giới hạn). Đây không phải công thức cứng nhắc nhưng là checklist hữu ích để không bỏ sót thông tin quan trọng.

---

### Anh Khang — Sao chưa đi làm? / AI-Ready Fresher

Anh Khang nói thẳng vào những gì nhiều sinh viên đang mắc kẹt — không phải thiếu kiến thức, mà thiếu sự chuẩn bị tâm thế và kỹ năng thực tế để bước vào môi trường làm việc.

**Tại sao nhiều bạn chưa đi làm dù đã "đủ điều kiện"?**

- Chờ bản thân "giỏi hơn" — nhưng không có mốc nào gọi là đủ giỏi cả
- Sợ thất bại, sợ bị hỏi những câu không biết trả lời
- Không biết mình thiếu gì vì chưa bao giờ thử

Anh Khang cho rằng đi làm sớm — dù ở vị trí intern hay part-time — là cách học nhanh nhất, không phải là rủi ro.

**Doanh nghiệp cần gì ở fresher?**

- Không phải người biết hết — mà là người **biết cách học và tự giải quyết vấn đề**
- Có ít nhất **một dự án thực tế** để kể — portfolio quan trọng hơn điểm GPA
- Biết cách **giao tiếp rõ ràng** về những gì mình đang làm và đang gặp khó khăn gì

**AI-Ready Fresher**

Một phần quan trọng của bài là nhìn nhận thực tế về AI trong thị trường lao động. Câu "AI có thay thế con người không?" được trả lời thẳng: AI không thay thế người, nhưng **người biết dùng AI sẽ thay thế người không biết**. Fresher cần học cách làm việc *cùng* AI — không phải cạnh tranh với nó.

Phần Q&A cuối rất sôi nổi, nhiều câu hỏi xoay quanh "có nên học thêm chứng chỉ không?", "portfolio cần có gì?" và "nên apply intern ở đâu trước?".

---

### Thư — BMAD

BMAD là một framework làm việc Thư giới thiệu như một cách tiếp cận có cấu trúc hơn khi làm việc cùng AI trên các dự án phức tạp. Thay vì cứ "chat với AI" theo kiểu tùy hứng, BMAD giúp định nghĩa rõ vai trò, nhiệm vụ và quy trình làm việc từ đầu.

Framework này đặc biệt hữu ích khi làm việc nhóm có sử dụng AI — vì nó giúp mọi người trong nhóm hiểu AI đang làm gì, tại sao, và kết quả được đánh giá theo tiêu chí nào. Phần demo nhỏ cuối phần này cho thấy sự khác biệt rõ rệt giữa workflow có cấu trúc và không có cấu trúc khi collaborate với AI.

---

### Demo — Tối ưu Prompt trực tiếp

Phần demo là phần thu hút sự chú ý nhất trong cả buổi. Người thực hiện lấy một prompt thực tế — loại prompt mà nhiều người hay viết — chạy thử, đọc output, sau đó phân tích từng điểm chưa ổn.

Sau đó cải thiện prompt từng bước một: thêm role, làm rõ task, giới hạn output, thêm ví dụ. Mỗi bước thay đổi, chạy lại và so sánh kết quả ngay trên màn hình. Chỉ trong 3–4 lần chỉnh, chất lượng output thay đổi rõ rệt — cả về độ chính xác lẫn định dạng.

Điều này không thể truyền đạt qua tài liệu hay slide. Phải nhìn tận mắt mới cảm nhận được tốc độ cải thiện khi biết cách sửa đúng chỗ.

---

## Điều mình mang về

Buổi này không phải kiểu event trình bày cho hoành tráng — nội dung thực tế, gần với những gì đang làm hàng ngày. Không có slide bóng bẩy hay số liệu ấn tượng, chỉ là những người đang làm chia sẻ những gì họ học được qua thực tế.

Ba điều đọng lại nhiều nhất sau buổi này:

1. **Thiết kế môi trường học quan trọng hơn ý chí** — thay vì "cố gắng hơn", hãy thay đổi môi trường xung quanh. Đây là thứ mình sẽ thử áp dụng ngay vào lịch học hàng ngày.

2. **Prompt tốt không phải viết dài hơn, mà là viết đúng hơn** — và quá trình tối ưu đó có thể được tự động hóa, không cần phụ thuộc vào cảm tính.

3. **Đi làm sớm không phải là bỏ cuộc học** — mà là cách học hiệu quả nhất. Môi trường thực tế dạy những thứ mà không có trường nào dạy được.

#### Một số hình ảnh khi tham gia sự kiện

<div style="display:flex;flex-wrap:wrap;gap:12px;align-items:flex-start">
<img src="/images/4-EventParticipated/4.1-Event1/02-thank-you-qrs.png" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.1-Event1/04-three-brain-hacks.png" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.1-Event1/06-turn-knowledge-dopamine.png" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.1-Event1/08-why-brain-social-media.png" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.1-Event1/z8013051068612_255e1ebc81570508ceeada2dfe8697ab.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.1-Event1/12.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.1-Event1/13.png" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
</div>
