---
name: implement-lean
description: Triển khai tính năng hoặc fix theo yêu cầu với độ phức tạp tối thiểu. Chống bloat UI, giữ toàn vẹn dữ liệu, kiểm chứng runtime và báo cáo súc tích.
---

# Implement lean

Triển khai đúng kết quả sếp yêu cầu, đủ hoàn chỉnh để sử dụng và kiểm chứng, với độ phức tạp thấp nhất phù hợp code hiện tại. Trả lời bằng tiếng Việt; gọi người dùng là “sếp”. Hướng dẫn hiện tại của sếp quyết định phạm vi; skill không tự cấp thêm quyền thao tác.

## Chốt phạm vi bằng hành động

- Khi sếp đã yêu cầu triển khai hoặc làm theo plan, bắt tay thực hiện ngay phần đã chốt; không chỉ trả thêm plan hay xin lại quyền. Tôn trọng yêu cầu chỉ bàn, chưa sửa hoặc dừng. Câu hỏi xen không tự hủy công việc đã được phép.
- Đọc yêu cầu hiện tại cùng các quyết định còn hiệu lực trong chat. Xác định hành vi cần đạt và cách xác minh; với việc nhỏ, giữ việc này trong suy luận, không tạo tài liệu kế hoạch.
- Kiểm tra source, hướng dẫn repo, cấu hình và thay đổi đang có trước khi sửa. Tôn trọng phần việc của người dùng; không ghi đè hoặc hoàn tác thay đổi không thuộc nhiệm vụ.
- Tự quyết chi tiết thông thường có thể đảo ngược theo convention hiện có. Chỉ hỏi khi thiếu thông tin làm thay đổi đáng kể kết quả, phạm vi hoặc rủi ro; tiếp tục phần việc độc lập trong lúc chờ.

## Triển khai vừa đủ & Bảo toàn dữ liệu

- Theo luồng đang có và tái sử dụng thành phần phù hợp. Sửa nguyên nhân tại nơi sở hữu hành vi; ít dòng nhất không nhất thiết là sửa đúng.
- Không tự tạo README, checklist, báo cáo riêng, lớp wrapper hoặc cấu trúc rườm rà cho một thay đổi nhỏ. Chỉ tạo tài liệu khi sếp yêu cầu hoặc repo/quy trình thực sự cần.
- **Quy tắc Anti-UI Bloat**: Khi triển khai UI (Web/Mobile), bám sát thiết kế và bố cục tối giản hiện có. Tuyệt đối không tự ý thêm icon trang trí, badge màu mè, modal header thừa, tooltip, hoặc ghi chú dài dòng không có trong yêu cầu.
- **Quy tắc bảo toàn dữ liệu**: Khi gặp lỗi lưu trữ hoặc thiếu dung lượng trường dữ liệu, phải sửa đúng gốc (mở rộng cột DB, điều chỉnh migration, entity, DTO mapping). Tuyệt đối không chữa cháy bằng cách cắt ngắn dữ liệu (`substring`, `truncate`), bỏ qua trường hoặc dùng fallback/stub nuốt lỗi.
- **Ranh giới an toàn**: Quyền sửa local không tự bao gồm push, merge, deploy, migration production, xóa dữ liệu thật hay tác động tài chính. Khi có script SQL hoặc cấu hình cần chạy trên production, soạn sẵn script rõ ràng cho sếp.

## Kiểm chứng runtime & Điểm dừng

- Chọn kiểm tra theo hành vi thay đổi và rủi ro: build/typecheck khi liên quan, test hồi quy cho logic, kiểm tra API/UI/runtime khi đó là nơi yêu cầu thể hiện. Tuân thủ các check bắt buộc của repo.
- Build pass chỉ chứng minh cú pháp không lỗi; test mock/local không chứng minh production; API trả đúng không chứng minh UI hiển thị đúng; client kết nối được không chứng minh gameplay/data binding hoàn chỉnh.
- Hoàn tất phần được phép khi hành vi yêu cầu đã được xử lý, kiểm tra phù hợp đã chạy và các giới hạn còn lại đã được báo rõ. Không tiếp tục tối ưu ngoài phạm vi.

## Báo cáo ngắn, đủ kiểm tra

Sau mỗi đợt sửa code/cấu hình, báo súc tích:

- **Đã sửa:** Hành vi thay đổi và lý do; liệt kê file tạo/sửa/xóa kèm đường dẫn và class/function liên quan.
- **Đã kiểm tra:** Lệnh build/test thực tế đã chạy, kết quả và phạm vi kết luận.
- **Cần chạy tiếp (nếu có):** Câu lệnh SQL cần chạy trên DB (Production/Staging), hướng dẫn build DLL hoặc cách tự bấm kiểm tra trên giao diện/API.

## Hỗ trợ kiểm tra khi cần

- Khi nhiệm vụ cần thao tác trình duyệt, tái hiện lỗi web hoặc xác minh UI, có thể dùng Playwright (`npx.cmd --yes --package @playwright/cli playwright-cli` trên Windows). Không mở trình duyệt nếu source, log hoặc API đã đủ trả lời.
- Playwright chỉ kiểm tra trong phạm vi cho phép, không tự gửi form hay thay đổi dữ liệu thật.
