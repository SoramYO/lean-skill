---
name: db-migration-lean
description: Thiết kế, rà soát và tạo script migration database (SQL Server, PostgreSQL, MySQL) an toàn cho Staging/Production. Chống lock bảng, idempotent và bắt buộc có script rollback. Dùng khi đụng schema DB hoặc gõ /migrate.
---

# Migration Database an toàn

- Trả lời tiếng Việt, gọi người dùng là sếp.
- Mọi thay đổi cấu trúc bảng, thêm cột, sửa kiểu dữ liệu hoặc tạo index phải tuân thủ nghiêm ngặt tính an toàn trên Production.

## 5 Nguyên tắc an toàn Production (Safety First)

1. **Tính lũy kế an toàn (Idempotent):**
   - Script chạy bao nhiêu lần cũng không gây lỗi.
   - Thêm cột: dùng `IF NOT EXISTS (SELECT * FROM sys.columns WHERE ...)` trước khi `ALTER TABLE ... ADD ...`.
   - Tạo bảng/index: dùng `IF NOT EXISTS`.
   - Xóa/sửa: dùng `IF EXISTS`.

2. **Bắt buộc bọc trong Transaction:**
   - Mọi câu lệnh DDL/DML quan trọng phải nằm trong:
     ```sql
     BEGIN TRANSACTION;
     BEGIN TRY
         -- Các câu lệnh migration
         COMMIT TRANSACTION;
         PRINT N'Migration thành công!';
     END TRY
     BEGIN CATCH
         ROLLBACK TRANSACTION;
         THROW;
     END CATCH
     ```

3. **Chống khóa bảng diện rộng (Table Lock):**
   - Không thêm cột `NOT NULL` kèm `DEFAULT` giá trị nặng trên bảng hàng triệu dòng trong giờ cao điểm.
   - Ưu tiên: Thêm cột `NULL` trước -> Backfill dữ liệu theo batch -> Sau đó mới đặt `NOT NULL` (nếu cần).
   - Tạo Index trên SQL Server: Cân nhắc `WITH (ONLINE = ON)` hoặc nhắc sếp chạy vào giờ thấp điểm.

4. **Bảo toàn dữ liệu (Data Integrity):**
   - Tuyệt đối cấm tự ý `DROP COLUMN` hoặc `ALTER COLUMN` giảm độ dài khi chưa kiểm tra dữ liệu hiện có.
   - Khi cần đổi kiểu dữ liệu: Tạo cột mới -> Chép dữ liệu -> Đổi tên cột, không ép kiểu trực tiếp làm mất dữ liệu.

5. **Bắt buộc có Script Rollback (Undo Script):**
   - Mỗi file/lần migration đều phải cung cấp song song script đảo ngược để sếp rollback ngay lập tức nếu deploy gặp sự cố.

## Đầu ra bắt buộc khi tạo Migration

Luôn tách biệt rõ 2 khối SQL riêng biệt:
- **Khối 1: Script Migration chính (Chạy trên DB Staging/Production)**.
- **Khối 2: Script Rollback dự phòng (Chạy khi muốn hoàn tác)**.
- Kèm 1 dòng cảnh báo về thời gian ước tính và rủi ro khóa bảng nếu có.
