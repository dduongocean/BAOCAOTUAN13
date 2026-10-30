# CHỦ ĐỀ 2: TỔ CHỨC BỐ CỤC LINH HOẠT VÀ XỬ LÝ KHÔNG GIAN
**Môn học:** Lập trình đa nền tảng  
**Thời lượng báo cáo:** 15 phút  

---

## 1. BẢNG PHÂN CÔNG NHIỆM VỤ

Bảng phân chia vai trò chuyên môn giữa các thành viên theo yêu cầu:

| Thành viên | Vai trò phụ trách | Nhiệm vụ cụ thể | Đóng góp |
| :--- | :--- | :--- | :---: |
| **Sơn** | • **UI Design**<br>• **State Management**<br>• **Báo cáo / Slide (Phần 1)** | - Thiết kế giao diện trực quan minh họa các trục (`Row`, `Column`, `Stack`).<br>- Xử lý trạng thái hoán đổi trục và cập nhật giao diện (`setState`).<br>- Soạn nội dung lý thuyết Trục căn chỉnh & Quy tắc layout. | **50%** |
| **Dương** | • **Business Logic**<br>• **Database / API (Mock Data)**<br>• **Báo cáo / Slide (Phần 2)** | - Hiện thực logic chia tỷ lệ `flex`, đo lường kích thước với `LayoutBuilder`.<br>- Xây dựng dữ liệu mẫu chuỗi dài để mô phỏng và kiểm thử lỗi Overflow.<br>- Soạn nội dung Expanded/Flexible, cơ chế Overflow & tổng hợp báo cáo. | **50%** |

---

## 2. PHÂN CHIA THUYẾT TRÌNH

| Người nói | Nội dung trình bày |
| :--- | :--- |
| **Sơn** | • Quy tắc layout cốt lõi trong Flutter (*Constraints - Sizes - Position*).<br>• **Main axis, Cross axis** trong `Row` và `Column`.<br>• Các thuộc tính căn chỉnh: `mainAxisAlignment`, `crossAxisAlignment`, `mainAxisSize`. |
| **Dương** | • Phân chia không gian: **`Expanded`** vs **`Flexible`** (hệ số `flex`, thuộc tính `fit`).<br>• Bố cục xếp lớp đa chiều (Z-axis): **`Stack`** và **`Positioned`**.<br>• **Hiện tượng Overflow:** Nguyên nhân và 4 giải pháp xử lý triệt để.<br>• Tổng kết và giải đáp câu hỏi (Q&A). |
---

## 3. TÓM TẮT CƠ SỞ LÝ THUYẾT TRỌNG TÂM

### A. Quy tắc layout cốt lõi của Flutter
> **"Constraints go down. Sizes go up. Parent sets position."**
1. **Cha truyền ràng buộc (`BoxConstraints`)** xuống con: gồm `minWidth, maxWidth, minHeight, maxHeight`.
2. **Con tự tính kích thước (`Size`)** dựa trên ràng buộc của cha và nội dung bên trong, rồi trả ngược lên cho cha.
3. **Cha quyết định vị trí (`Position`)** của con tại tọa độ `(x, y)`.

### B. Main Axis, Cross Axis và các thuộc tính căn chỉnh
- **Main Axis (Trục chính):** Trục dọc theo hướng sắp xếp (`Row` là trục ngang, `Column` là trục dọc).
- **Cross Axis (Trục phụ):** Trục vuông góc với trục chính (`Row` là trục dọc, `Column` là trục ngang).
- **`mainAxisAlignment`:** `start`, `center`, `end`, `spaceBetween`, `spaceAround`, `spaceEvenly`.
- **`crossAxisAlignment`:** `start`, `center`, `end`, `stretch` (kéo dãn hết trục phụ).
- **`mainAxisSize`:** `MainAxisSize.max` (chiếm hết không gian) vs `MainAxisSize.min` (co khít nội dung).

### C. Expanded, Flexible, Stack và Positioned
- **Hệ số `flex`:** Chia sẻ phần không gian còn trống theo tỷ lệ (mặc định `flex: 1`).
- **`Expanded` (`fit: FlexFit.tight`):** Bắt buộc con phải bung ra chiếm trọn 100% không gian được phân chia.
- **`Flexible` (`fit: FlexFit.loose`):** Cho phép con giữ kích thước tự nhiên nếu nội dung nhỏ, phần thừa để trống.
- **`Stack` & `Positioned`:** Xếp các widget đè lớp lên nhau theo chiều sâu (Z-axis); `Positioned` giúp ghim vị trí tuyệt đối theo pixel (`top`, `bottom`, `left`, `right`).

### D. Hiện tượng Overflow & Giải pháp khắc phục
- **Bản chất:** Widget con có kích thước vượt quá giới hạn tối đa mà widget cha cấp phát trên trục chính, làm xuất hiện dải sọc vàng đen (`RenderFlex overflowed`).
- **4 tình huống và giải pháp:**
  1. **Text dài trong `Row`:** Bọc `Text` trong `Expanded` + `overflow: TextOverflow.ellipsis`.
  2. **Danh sách dọc vượt màn hình:** Bọc `Column` trong `SingleChildScrollView` hoặc dùng `ListView`.
  3. **Nhiều thẻ ngang (Tags/Chips):** Thay `Row` bằng widget `Wrap` (tự động rớt xuống dòng khi hết chỗ).
  4. **Bố cục đa kích thước màn hình:** Dùng `LayoutBuilder` để tự động đổi dạng hiển thị (ngang/dọc).
