import 'package:custom_drawer/my_custom_clipper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.items});

  final List<({Widget icon, String title})> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: MyCustomClipper(),
        child: Container(
          color: Colors.blue,
          padding: const EdgeInsets.only(left: 18),
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
