---
name: review-lean
description: Soi xét code, git diff và bảo mật trước khi commit/deploy. Phát hiện breaking change, rò rỉ secret, rác trong diff và rủi ro runtime. Dùng khi yêu cầu review, kiểm tra trước khi commit/push, hoặc gõ /review.
---

# Review code gọn & Bảo mật

- Trả lời tiếng Việt, gọi người dùng là sếp. Đánh giá thẳng thắn, trực diện, không khen xã giao.
- Kiểm tra `git diff` (hoặc `git diff --staged`) và source code liên quan trước khi đưa ra nhận xét.

## Các tiêu chí soi xét cốt tử

1. **Bảo mật & Rò rỉ thông tin (Secrets & Safety):**
   - Quét tìm API key, secret token, password, connection string bị hardcode vào source code.
   - Kiểm tra log nhạy cảm (không in token, mật khẩu, CCCD/thông tin cá nhân ra console/file log).
   - Kiểm tra lỗ hổng bảo mật cơ bản: SQL Injection (raw query không tham số), thiếu kiểm tra quyền (Authorization/Role check) tại endpoint mới.

2. **Tương thích ngược & Hợp đồng dữ liệu (Breaking Changes):**
   - Soi kỹ thay đổi schema DB, endpoint API hoặc model DTO: Đổi tên trường, đổi kiểu dữ liệu, hoặc biến trường bắt buộc thành không bắt buộc (và ngược lại).
   - Cảnh báo ngay nếu thay đổi làm gãy (crash) Mobile App hoặc Web Client phiên bản cũ đang chạy thực tế.

3. **Vệ sinh Git Diff (Diff Hygiene):**
   - Phát hiện các lệnh debug tạm bợ: `console.log`, `print`, `var_dump`, comment nhảm, TODO bỏ dở.
   - Phát hiện file cấu hình local (`.env`, `appsettings.Development.json`) hoặc file build rác (`.dll`, `.class`, `.pyc`) bị stage nhầm.
   - Phát hiện việc tiện tay reformat code làm bẩn git diff ngoài phạm vi nhiệm vụ.

4. **Hiệu năng & Rủi ro Runtime:**
   - Truy vấn DB: N+1 query trong vòng lặp, thiếu điều kiện WHERE, thiếu paging trên bảng lớn.
   - Xử lý bất đồng bộ & bộ nhớ: Quên dispose stream/connection, unhandled exception, rò rỉ listener/timer.
   - Bắt lỗi dữ liệu: Tuyệt đối không chấp nhận giải pháp cắt bớt chuỗi (`substring`/`truncate`) hoặc `try-catch` rỗng để nuốt lỗi.

## Báo cáo Review chuẩn (phân tầng rõ ràng)

Chỉ báo các điểm thực sự có vấn đề, phân theo 3 cấp độ:
- 🔴 **Chặn (Blocker)**: Lỗi bảo mật, rò rỉ secret, nguy cơ crash runtime, breaking change ảnh hưởng client. Phải sửa trước khi commit/deploy.
- 🟡 **Cảnh báo (Warning)**: Hiệu năng kém, rác debug, format bẩn diff, thiếu index.
- 🟢 **Khuyến nghị (Nit)**: Góp ý cấu trúc tối giản hơn nếu có.

Nếu diff sạch và đạt chuẩn: Báo 1 dòng khẳng định diff an toàn để commit.
