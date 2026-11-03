---
name: debug-lean
description: Điều tra nguyên nhân gốc rễ (root cause) dựa trên bằng chứng runtime và log thực tế, sau đó sửa triệt để khi được phép.
---

# Debug theo bằng chứng

- Trả lời tiếng Việt, gọi người dùng là sếp. Bắt đầu từ triệu chứng, đầu vào, kết quả mong đợi, môi trường và log/stack trace thực tế.

## Điều tra theo chuỗi dữ liệu (End-to-End Tracing)
- Lần theo đường thực thi từ nguồn dữ liệu (Database / File / Socket) -> Xử lý (Backend / Engine / Physics) -> Đầu ra (API JSON DTO / Network Packet) -> Hiển thị (Mobile / Web Client).
- Kiểm tra sai lệch model binding (naming convention `camelCase` vs `snake_case`, kiểu dữ liệu nullable, relative path của asset/resource, SQL query trả về rỗng do mapping store code/id).
- Với lỗi logic game / thuật toán (vật lý, góc bắn, lực bắn, chuyển động): Kiểm tra trực tiếp công thức toán học và tọa độ thay vì chỉ kiểm tra luồng gửi nhận packet.

## Bằng chứng hơn suy đoán
- Dùng kiểm tra nhỏ nhất có ích để phân biệt giả thuyết. Tách dữ kiện (fact) khỏi suy luận, giả định và phỏng đoán; đọc code đúng cú pháp không chứng minh dữ liệu hay cấu hình runtime đúng.
- Tuyệt đối không che lỗi bằng `try-catch` rỗng, fallback giả lập, stub hoặc nuốt exception rồi báo hoàn tất.
- Nếu chưa kết luận được, nêu rõ đã kiểm tra gì, kết quả và bằng chứng chính xác còn thiếu.

## Sửa chữa triệt để khi được phép
- Chỉ yêu cầu chẩn đoán thì chưa sửa code. Nếu đã yêu cầu sửa lỗi, tiếp tục sửa và kiểm chứng trong quyền hiện có; không dừng ở phỏng đoán hoặc xin lại quyền.
- Trước khi sửa, đọc hướng dẫn repo và diff hiện có; giữ thay đổi của người dùng. Sửa tại nơi sở hữu nguyên nhân, giữ kiến trúc và hành vi ngoài phạm vi. Không thêm refactor, schema, dependency hoặc tài liệu không cần thiết.
- Quyền sửa local không tự cấp quyền deploy, push, merge hay sửa dữ liệu production. Với giao dịch lỗi, kiểm tra trạng thái trước retry để tránh xử lý hai lần.

## Kiểm chứng và báo cáo
- Kiểm chứng trước/sau khi khả thi, thêm test hồi quy có giá trị và chạy check repo bắt buộc. Nêu rõ nếu không tái hiện hoặc không truy cập được môi trường lỗi. Build pass không chứng minh runtime/production đúng.
- Báo nguyên nhân gốc rễ với bằng chứng cụ thể; nếu sửa thì nêu thay đổi/lý do, file tạo/sửa/xóa kèm đường dẫn và class/function, kiểm tra thực sự đã chạy và kết quả.

## Hỗ trợ kiểm tra khi cần
- Khi nhiệm vụ cần thao tác trình duyệt, tái hiện lỗi web hoặc xác minh UI, có thể dùng Playwright (`npx.cmd --yes --package @playwright/cli playwright-cli` trên Windows). Dùng snapshot mới để kiểm tra kết quả sau thao tác.
