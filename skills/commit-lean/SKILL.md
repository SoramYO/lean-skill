---
name: commit-lean
description: Tự động phân tích git status, git diff và tạo commit message chuẩn mực Conventional Commits. Dùng khi yêu cầu tạo commit, chuẩn bị push, hoặc gõ /commit.
---

# Commit chuẩn gọn

- Trả lời tiếng Việt, gọi người dùng là sếp.
- Kiểm tra `git status` và `git diff` (ưu tiên `git diff --staged` nếu đã add, hoặc toàn bộ thay đổi nếu chưa add).

## Quy chuẩn Conventional Commits

Format commit:
```text
<type>(<scope>): <mô tả ngắn bằng tiếng Việt hoặc tiếng Anh kỹ thuật>

[Tùy chọn: 1-2 gạch đầu dòng giải thích lý do kỹ thuật nếu thay đổi phức tạp]
```

1. **Type chuẩn:**
   - `feat`: Tính năng mới cho người dùng hoặc API mới.
   - `fix`: Sửa lỗi logic, sửa bug crash, sửa hiển thị.
   - `refactor`: Tái cấu trúc code nội bộ, không đổi hành vi người dùng.
   - `db`: Thay đổi schema, migration, seed data hoặc stored procedure.
   - `perf`: Tối ưu hiệu năng, giảm thời gian query hoặc render.
   - `chore`: Cập nhật cấu hình build, dependency, script CI/CD.
2. **Scope:** Tên module/tầng bị tác động (vd: `auth`, `loyalty`, `store-sync`, `mobile`, `api`, `game-bot`).
3. **Nội dung:**
   - Viết ngắn, nêu đúng **bản chất thay đổi và lý do kỹ thuật**, không nói chung chung kiểu "update code", "fix bug".
   - Không liệt kê lại danh sách tên file trong commit message (vì git diff đã lưu việc đó).

## Hành động thực thi

- Luôn kiểm tra xem có file rác, file `.env` hoặc file untracked bị add nhầm hay không trước khi commit.
- Soạn sẵn lệnh `git commit -m "..."` cho sếp.
- Nếu sếp đã nói "commit đi" hoặc giao quyền commit: Tự chạy `git commit` cho các file liên quan.
- **Ranh giới an toàn**: Quyền commit local KHÔNG tự cấp quyền `git push`. Chỉ push khi sếp yêu cầu rõ ràng.
