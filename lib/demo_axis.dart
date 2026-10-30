import 'package:flutter/material.dart';

// File 1: Main Axis, Cross Axis và Căn chỉnh
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
            width: double.infinity, // Mở rộng hết cỡ để quan sát rõ cả 2 trục
            height: double.infinity,
            color: Colors.grey[200],
            child: isRow
                ? Row(
                    mainAxisSize: MainAxisSize.max,                   // max: chiếm hết trục chính | min: co khít các con
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Trục chính (Ngang): start, center, spaceBetween, spaceEvenly...
                    crossAxisAlignment: CrossAxisAlignment.center,    // Trục phụ (Dọc): start, center, end, stretch
                    children: _boxes(),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.max,                   // max: chiếm hết trục chính | min: co khít các con
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Trục chính (Dọc): start, center, spaceBetween, spaceEvenly...
                    crossAxisAlignment: CrossAxisAlignment.center,    // Trục phụ (Ngang): start, center, end, stretch
                    children: _boxes(),
                  ),
          ),
        ),
      ],
    );
  }

  // 3 khối hộp đơn giản có nhãn phân biệt
  List<Widget> _boxes() => [
        Container(
          width: 60,
          height: 60,
          color: Colors.red,
          child: const Center(
            child: Text('1', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
        Container(
          width: 80,
          height: 80,
          color: Colors.green,
          child: const Center(
            child: Text('2 (Lớn)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
        Container(
          width: 60,
          height: 60,
          color: Colors.blue,
          child: const Center(
            child: Text('3', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
      ];
}
