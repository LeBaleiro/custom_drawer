import 'package:custom_drawer/my_custom_painter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.items});

  final List<({Widget icon, String title})> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        size: Size(500, (500 * 1).toDouble()),
        painter: MyCustomPainter(),
        child: Container(
          // color: Colors.blue,
          // width: 500,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => ListTile(
              leading: items[index].icon,
              title: Text(items[index].title),
            ),
          ),
        ),
      ),
    );
  }
}
