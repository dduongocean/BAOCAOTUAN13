import 'package:flutter/material.dart';

// File 1: Main Axis, Cross Axis và Căn chỉnh (Dương thuyết trình)
class DemoAxis extends StatefulWidget {
  const DemoAxis({super.key});

  @override
  State<DemoAxis> createState() => _DemoAxisState();
}

class _DemoAxisState extends State<DemoAxis> {
  bool isRow = true; // true = Row, false = Column

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        // Nút chuyển giữa Row và Column
        ElevatedButton(
          onPressed: () => setState(() => isRow = !isRow),
          child: Text(isRow ? 'Đang là Row (Ngang)' : 'Đang là Column (Dọc)'),
        ),
        const SizedBox(height: 10),

        // Vùng hiển thị các khối con
        Expanded(
          child: Container(
            color: Colors.grey[200],
            child: isRow
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Chia đều khoảng cách
                    crossAxisAlignment: CrossAxisAlignment.center,   // Căn giữa trục phụ
                    children: _boxes(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _boxes(),
                  ),
          ),
        ),
      ],
    );
  }

  // 3 khối hộp đơn giản
  List<Widget> _boxes() => [
        Container(width: 60, height: 60, color: Colors.red),
        Container(width: 80, height: 80, color: Colors.green),
        Container(width: 60, height: 60, color: Colors.blue),
      ];
}
