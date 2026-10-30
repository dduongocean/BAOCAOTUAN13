import 'package:flutter/material.dart';
import 'demo_axis.dart';
import 'demo_flex_stack.dart';
import 'demo_overflow.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyDemo(),
    ));

class MyDemo extends StatelessWidget {
  const MyDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chủ đề 2: Bố cục Flutter (Dương & Sơn)'),
          bottom: const TabBar(
            tabs: [
              Tab(text: '1. Axis'),
              Tab(text: '2. Flex & Stack'),
              Tab(text: '3. Overflow & Responsive'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DemoAxis(),
            DemoFlexStack(),
            DemoOverflow(),
          ],
        ),
      ),
    );
  }
}
