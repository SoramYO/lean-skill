---
name: targeted-edit-lean
description: Sửa chính xác các điểm cụ thể trong code, UI, config hoặc plan. Bảo toàn tuyệt đối các phần xung quanh và giữ sạch git diff.
---

# Sửa từng phần

- Trả lời tiếng Việt, gọi người dùng là sếp. Ngắn gọn, trực diện.
- Xác định đúng đối tượng từ ngữ cảnh: code, UI, query, config hay plan. Sửa plan không đồng nghĩa sửa code; chỉ hỏi nếu tham chiếu chưa rõ có thể làm đổi kết quả.
- Đọc hướng dẫn repo, phần cần sửa, các component liên quan và git diff đang có trước khi sửa. Giữ nguyên thay đổi của người dùng và các quyết định đã chốt.
- **Sửa đúng điểm được yêu cầu**: Không viết lại toàn bộ file, không tiện tay reformat mã nguồn làm bẩn git diff, không đổi style hoặc kiến trúc ngoài phạm vi. Chỉ sửa thêm phụ thuộc thật sự cần thiết và giải thích lý do; lỗi ngoài phạm vi có thể báo ngắn, không tự gộp vào lần sửa.
- **Bảo toàn layout & logic xung quanh**: Khi sửa 1 thành phần UI (như modal, bảng, form search), giữ nguyên trạng thái hiển thị, z-index, cuộn trang và các props xung quanh; không làm xuất hiện header thừa hoặc phá vỡ CSS sẵn có.
- **Tương thích Model - View**: Khi đổi tên trường, thêm cột hoặc chỉnh dữ liệu hiển thị, bảo đảm binding DTO/model đồng bộ, không gây lỗi `null` / `undefined` ngầm tại runtime.
- Đối chiếu diff cuối với từng yêu cầu. Kiểm tra tương xứng: build/test cho logic khi cần, cùng check bắt buộc của repo.
- Báo ngắn: Thay đổi và lý do; file tạo/sửa/xóa kèm đường dẫn và class/function; kiểm tra thực sự đã chạy và kết quả.

## Hỗ trợ kiểm tra khi cần
- Khi nhiệm vụ cần thao tác trình duyệt hoặc xác minh UI web, có thể dùng Playwright (`npx.cmd --yes --package @playwright/cli playwright-cli` trên Windows). Dùng snapshot mới để kiểm tra kết quả sau thao tác.
