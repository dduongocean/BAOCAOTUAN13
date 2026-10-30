import 'package:flutter/material.dart';

// File 2: Expanded, Flexible, Stack và Positioned
class DemoFlexStack extends StatelessWidget {
  const DemoFlexStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Expanded: ép bung hết theo tỷ lệ (bản chất: fit = FlexFit.tight)
          const Text(
            '1. Expanded (fit: FlexFit.tight - tỷ lệ flex 2 : 1):',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                flex: 2, // Chiếm 2/3 không gian trống
                child: Container(
                  height: 40,
                  color: Colors.blue,
                  child: const Center(
                    child: Text('flex: 2 (tight)', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Expanded(
                flex: 1, // Chiếm 1/3 không gian trống
                child: Container(
                  height: 40,
                  color: Colors.orange,
                  child: const Center(
                    child: Text('flex: 1 (tight)', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // 2. Flexible: chỉ ôm vừa chữ, không ép bung hết (fit: FlexFit.loose)
          const Text(
            '2. Flexible (fit: FlexFit.loose - không ép bung hết):',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Container(
            color: Colors.grey[300],
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.loose, // Mặc định: con giữ kích thước tự nhiên của nó
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green,
                    child: const Text('Flexible: chỉ ôm vừa chữ, không chiếm hết hàng'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 3. Stack & Positioned: xếp đè lớp và ghim góc
          const Text(
            '3. Stack & Positioned (xếp đè lớp theo trục Z):',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 150,
            height: 90,
            child: Stack(
              children: [
                Container(color: Colors.indigo[100]), // Lớp nền dưới
                const Positioned(                     // Lớp trên ghim góc tuyệt đối
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
