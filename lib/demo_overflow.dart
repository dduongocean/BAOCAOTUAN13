import 'package:flutter/material.dart';

// File 3: Xử lý Overflow & Bố cục đáp ứng
class DemoOverflow extends StatefulWidget {
  const DemoOverflow({super.key});

  @override
  State<DemoOverflow> createState() => _DemoOverflowState();
}

class _DemoOverflowState extends State<DemoOverflow> {
  bool isFixedText = false; // false: bị lỗi sọc vàng đen trong Row do Text, true: đã sửa bằng Expanded
  bool isFixedWrap = true;  // false: Row chứa nhiều chip gây tràn, true: Wrap tự xuống dòng

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. DEMO LỖI OVERFLOW TRONG ROW DO TEXT DÀI
          const Text(
            '1. Lỗi Overflow do Text dài trong Row (Sửa: Expanded + ellipsis):',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          ElevatedButton(
            onPressed: () => setState(() => isFixedText = !isFixedText),
            child: Text(isFixedText ? 'ĐÃ SỬA (Bấm xem lỗi sọc vàng đen)' : 'BỊ LỖI (Bấm để sửa bằng Expanded)'),
          ),
          const SizedBox(height: 8),
          Container(
            color: Colors.grey[200],
            child: isFixedText
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

          // 2. DEMO LỖI OVERFLOW KHI NHIỀU PHẦN TỬ NGANG (Sửa: Thay Row bằng Wrap)
          const Text(
            '2. Lỗi Overflow nhiều phần tử ngang (Sửa: Dùng Wrap thay Row):',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          ElevatedButton(
            onPressed: () => setState(() => isFixedWrap = !isFixedWrap),
            child: Text(isFixedWrap ? 'ĐÃ SỬA DÙNG WRAP (Bấm xem Row bị tràn)' : 'BỊ LỖI ROW (Bấm để sửa bằng Wrap)'),
          ),
          const SizedBox(height: 8),
          Container(
            color: Colors.grey[200],
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            child: isFixedWrap
                // ĐÃ SỬA: Dùng Wrap tự động rớt dòng
                ? Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: _demoChips(),
                  )
                // BỊ LỖI: Row không thể tự rớt dòng nên tràn màn hình
                : Row(
                    children: _demoChips(),
                  ),
          ),
          const SizedBox(height: 24),

          // 3. BỐ CỤC PHẢN ỨNG THAY ĐỔI KÍCH THƯỚC (RESPONSIVE)
          const Text(
            '3. Bố cục phản ứng khi đổi kích thước (LayoutBuilder):',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 120,
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Nếu bề rộng > 400px thì xếp ngang (Row), ngược lại xếp dọc (Column)
                bool isWide = constraints.maxWidth > 400;
                return Container(
                  width: double.infinity,
                  color: Colors.blue[50],
                  padding: const EdgeInsets.all(12),
                  child: isWide
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(width: 60, height: 60, color: Colors.blue),
                            const Text('Màn hình RỘNG (>400px): Tự xếp dạng Row'),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(width: 50, height: 50, color: Colors.blue),
                            const SizedBox(height: 6),
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

  List<Widget> _demoChips() => const [
        Chip(label: Text('Flutter')),
        Chip(label: Text('Row/Column')),
        Chip(label: Text('Expanded')),
        Chip(label: Text('Flexible')),
        Chip(label: Text('Stack')),
        Chip(label: Text('Wrap')),
      ];
}
