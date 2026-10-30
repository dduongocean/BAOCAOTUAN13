import 'package:flutter/material.dart';

// File 3: Xử lý Overflow & Bố cục đáp ứng (Dương & Sơn)
class DemoOverflow extends StatefulWidget {
  const DemoOverflow({super.key});

  @override
  State<DemoOverflow> createState() => _DemoOverflowState();
}

class _DemoOverflowState extends State<DemoOverflow> {
  bool isFixed = false; // false: bị lỗi sọc vàng đen, true: đã sửa bằng Expanded

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. DEMO LỖI OVERFLOW VÀ CÁCH SỬA
          const Text('1. Lỗi Overflow trong Row:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          ElevatedButton(
            onPressed: () => setState(() => isFixed = !isFixed),
            child: Text(isFixed ? 'ĐÃ SỬA (Bấm để xem lỗi sọc vàng đen)' : 'BỊ LỖI (Bấm để sửa)'),
          ),
          const SizedBox(height: 8),

          Container(
            color: Colors.grey[200],
            child: isFixed
                // ĐÃ SỬA: Bọc bằng Expanded + ellipsis
                ? const Row(
                    children: [
                      Icon(Icons.check, color: Colors.green),
                      Expanded(
                        child: Text(
                          'Đoạn chữ rất dài trong Row đã bọc Expanded nên tự co gọn và thêm ba chấm...',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                // BỊ LỖI: Row chứa Text dài không có Expanded gây sọc vàng đen
                : const Row(
                    children: [
                      Icon(Icons.warning, color: Colors.red),
                      Text('Đoạn chữ rất dài trong Row không bọc Expanded cố tình gây tràn màn hình!'),
                    ],
                  ),
          ),
          const SizedBox(height: 24),

          // 2. BỐ CỤC PHẢN ỨNG THAY ĐỔI KÍCH THƯỚC (RESPONSIVE)
          const Text('2. Bố cục phản ứng khi đổi kích thước màn hình:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Nếu bề rộng > 400px thì xếp ngang (Row), ngược lại xếp dọc (Column)
                bool isWide = constraints.maxWidth > 400;
                return Container(
                  width: double.infinity,
                  color: Colors.blue[50],
                  padding: const EdgeInsets.all(16),
                  child: isWide
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(width: 70, height: 70, color: Colors.blue),
                            const Text('Màn hình RỘNG (>400px): Tự xếp dạng Row'),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(width: 70, height: 70, color: Colors.blue),
                            const SizedBox(height: 8),
                            const Text('Màn hình HẸP: Tự chuyển sang Column'),
                          ],
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

