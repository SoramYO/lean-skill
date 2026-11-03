---
name: plan-lean
description: Lập hoặc điều chỉnh kế hoạch triển khai tinh gọn, bám sát kiến trúc thực tế. Phân tách rõ code local, script database/production và các bước kiểm chứng.
---

# Lập plan gọn

- Trả lời tiếng Việt, gọi người dùng là sếp. Ngắn gọn, trực diện, không rào đón.
- Kiểm tra source, hướng dẫn repo, schema và các quyết định còn hiệu lực để plan có căn cứ thực tế; lịch sử không chứng minh trạng thái hiện tại.
- Chọn phương án đơn giản nhất phù hợp kiến trúc hiện có. Không tự thêm tính năng tương lai, refactor tiện tay, framework hoặc backlog cải tiến ngoài yêu cầu.
- Việc nhỏ dùng vài ý trong chat. Chỉ tạo file plan (ví dụ `plans/.../plan.md`) khi sếp yêu cầu hoặc repo bắt buộc. Khi chỉnh plan, sửa đúng phần được yêu cầu và phụ thuộc cần thiết, giữ các quyết định khác.

## Cấu trúc plan tiêu chuẩn (cực gọn)
1. **Mục tiêu & Phạm vi (Scope)**: Hành vi cần đạt, danh sách file dự kiến sửa hoặc tạo mới.
2. **Các bước triển khai (Implementation)**: Trình tự thực hiện theo phụ thuộc (Backend/API -> Frontend/Mobile -> Cấu hình).
3. **Thao tác thủ công & Database (nếu có)**: Tách riêng câu lệnh SQL (cho Staging/Production) và hướng dẫn build (cần update DLL nào, restart service nào).
4. **Kịch bản kiểm chứng (Verification)**: Lệnh build/test cụ thể và cách kiểm tra runtime thực tế (API payload, giao diện, dữ liệu hiển thị).

## Ranh giới thực thi
- Lập hoặc sửa plan không tự cấp quyền sửa code. Nếu sếp đồng thời yêu cầu plan và implement ("lên plan rồi làm luôn"), tiến hành cả hai trong quyền hiện có; khi sếp đã bảo làm, không xin lại xác nhận.
- Đánh dấu rõ giả định chưa kiểm tra. Không báo bước dự kiến như việc đã hoàn thành.

## Hỗ trợ kiểm tra khi cần
- Khi nhiệm vụ cần thao tác trình duyệt hoặc xác minh UI, có thể dùng Playwright (`npx.cmd --yes --package @playwright/cli playwright-cli` trên Windows). Chỉ dùng khi thực sự cần thiết để lập plan chính xác.
