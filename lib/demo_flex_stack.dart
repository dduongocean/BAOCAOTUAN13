import 'package:flutter/material.dart';

// File 2: Expanded, Flexible, Stack và Positioned (Sơn thuyết trình)
class DemoFlexStack extends StatelessWidget {
  const DemoFlexStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Expanded: ép bung hết theo tỷ lệ 2 : 1
          const Text('1. Expanded (flex: 2 và flex: 1):', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 40,
                  color: Colors.blue,
                  child: const Center(child: Text('flex: 2', style: TextStyle(color: Colors.white))),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 40,
                  color: Colors.orange,
                  child: const Center(child: Text('flex: 1', style: TextStyle(color: Colors.white))),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // 2. Flexible: chỉ ôm vừa chữ, không ép bung hết
          const Text('2. Flexible (chỉ chiếm vừa đủ nội dung):', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Container(
            color: Colors.grey[300],
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green,
                    child: const Text('Flexible chỉ ôm vừa chữ'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 3. Stack & Positioned: xếp đè lớp và ghim góc
          const Text('3. Stack & Positioned (xếp đè lớp):', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          SizedBox(
            width: 150,
            height: 90,
            child: Stack(
              children: [
                Container(color: Colors.indigo[100]), // Lớp nền dưới
                const Positioned(                     // Lớp trên ghim góc
                  top: 8,
                  right: 8,
                  child: Icon(Icons.star, color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
