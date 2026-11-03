# Lean Skills

Bộ skill tinh gọn (lean) và quy tắc làm việc thực chiến dành cho **Antigravity IDE** và **Codex CLI**.

Được tối ưu cho môi trường lập trình thực tế (.NET, Java, Flutter, Web/Next.js, SQL Server/Firebase), loại bỏ văn mẫu, chống bloat code/UI và bám sát nguyên tắc kỹ thuật dựa trên bằng chứng.

---

## 🎯 Các Skill trong bộ

| Skill | Mục đích | Khi nào dùng |
| :--- | :--- | :--- |
| **`discuss-lean`** | Thảo luận kỹ thuật & trade-off | Khi cần phân tích phương án, data mapping hoặc kiến trúc trước khi code. Chốt dứt khoát 1 lựa chọn. |
| **`plan-lean`** | Lập plan tinh gọn | Khi cần kế hoạch nhiều bước. Tách rõ: Code Local, Script DB Production, Lệnh build DLL. |
| **`implement-lean`** | Triển khai tính năng | Khi đã chốt yêu cầu. Cấm UI bloat (icon/ghi chú thừa), cấm cắt bớt dữ liệu (truncate/substring). |
| **`targeted-edit-lean`**| Sửa từng điểm cụ thể | Khi sửa 1-2 vị trí giao diện, fix nhỏ. Giữ nguyên 100% bố cục và logic xung quanh, sạch git diff. |
| **`debug-lean`** | Debug theo bằng chứng | Lần theo chuỗi dữ liệu (Data $\rightarrow$ API $\rightarrow$ Client). Cấm dùng fallback/stub nuốt lỗi. |

---

## 📋 Quy tắc làm việc (AGENTS.md)

Repo đi kèm file [AGENTS.md](./AGENTS.md) chuẩn phong cách Caveman (cắt giảm token, mệnh lệnh đanh thép):
- **Accuracy-first**: Đúng hơn đồng ý. Sếp sai chỉ rõ lý do.
- **Root Cause**: Trị tận gốc, không chữa cháy bề mặt.
- **Anti-UI Bloat**: Cấm tự thêm icon, badge, tooltip hay text thừa thãi.
- **Báo cáo súc tích**: 3 ý ngắn (Đã sửa, Đã kiểm tra, Cần chạy tiếp).

---

## 🚀 Cài đặt

### Cách 1: Tự động bằng PowerShell (Windows)

```powershell
git clone https://github.com/SoramYO/lean-skill.git
cd lean-skill
.\install.ps1
```

Script sẽ tự động copy toàn bộ skill vào:
- `~/.gemini/config/skills/` (Antigravity IDE)
- `~/.codex/skills/` (Codex CLI)

### Cách 2: Cài thủ công

Copy các thư mục trong `skills/` vào thư mục skill tương ứng:
- **Antigravity**: `C:\Users\<User>\.gemini\config\skills\`
- **Codex**: `C:\Users\<User>\.codex\skills\`

---

## 📜 Giấy phép

MIT License.
