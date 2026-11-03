# Lean Skills

Bộ skill tinh gọn (lean) và quy tắc làm việc thực chiến dành cho **Antigravity IDE** và **Codex CLI**.

Được tối ưu cho môi trường lập trình thực tế (.NET, Java, Flutter, Web/Next.js, SQL Server/Firebase), loại bỏ văn mẫu, chống bloat code/UI, bảo vệ toàn vẹn dữ liệu và bám sát nguyên tắc kỹ thuật dựa trên bằng chứng.

---

## 🎯 Danh mục 8 Lean Skills (Full Dev Lifecycle)

| Lệnh / Skill | Mục đích cốt lõi | Khi nào dùng |
| :--- | :--- | :--- |
| **`discuss-lean`** (`/discuss`) | Thảo luận kỹ thuật & trade-off | Khi cần phân tích phương án, data mapping hoặc kiến trúc trước khi code. Chốt dứt khoát 1 lựa chọn. |
| **`plan-lean`** (`/plan`) | Lập plan tinh gọn | Khi cần kế hoạch nhiều bước. Tách rõ: Code Local, Script DB Production, Lệnh build DLL. |
| **`implement-lean`** (`/cook`, `/impl`) | Triển khai tính năng | Khi đã chốt yêu cầu. Cấm UI bloat (icon/ghi chú thừa), cấm cắt bớt dữ liệu (truncate/substring). |
| **`targeted-edit-lean`** | Sửa từng điểm cụ thể | Khi sửa 1-2 vị trí giao diện, fix nhỏ. Giữ nguyên 100% bố cục và logic xung quanh, sạch git diff. |
| **`debug-lean`** (`/debug`) | Debug theo bằng chứng | Lần theo chuỗi dữ liệu (Data $\rightarrow$ API $\rightarrow$ Client). Cấm dùng fallback/stub nuốt lỗi. |
| **`review-lean`** (`/review`) | Soi xét bảo mật & diff | Quét secret, breaking change, rác debug trước khi commit hoặc merge. Phân tầng Blocker / Warning. |
| **`commit-lean`** (`/commit`) | Tạo Git Commit chuẩn | Tự động phân tích git diff tạo Conventional Commits (`feat`, `fix`, `refactor`, `db`...). |
| **`db-migration-lean`** (`/migrate`) | Migration Database an toàn | Tạo script idempotent (`IF NOT EXISTS`), bọc Transaction, chống table lock, bắt buộc có Rollback script. |

---

## 📋 Quy tắc làm việc (AGENTS.md)

Repo đi kèm file [AGENTS.md](./AGENTS.md) chuẩn phong cách Caveman (cắt giảm 50% token, mệnh lệnh đanh thép):
- **Accuracy-first**: Đúng hơn đồng ý. Sếp sai chỉ rõ lý do.
- **Root Cause**: Trị tận gốc, không chữa cháy bề mặt.
- **Anti-UI Bloat**: Cấm tự thêm icon, badge, tooltip hay text thừa thãi.
- **Báo cáo súc tích**: 3 ý ngắn (Đã sửa, Đã kiểm tra, Cần chạy tiếp).

---

## 🚀 Cài đặt 1-Click

### Dành cho Antigravity IDE & Codex CLI (Windows)

```powershell
git clone https://github.com/SoramYO/lean-skill.git
cd lean-skill
.\install.ps1
```

Script sẽ tự động copy toàn bộ 8 skill vào:
- `~/.gemini/config/skills/` (Antigravity IDE)
- `~/.codex/skills/` (Codex CLI)

---

## 📜 Giấy phép

MIT License.
