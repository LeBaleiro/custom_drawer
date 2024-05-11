import 'package:custom_drawer/custom_drawer_item.dart';
import 'package:custom_drawer/my_custom_clipper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.items});

  final List<({Widget icon, Widget title})> items;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: MyCustomClipper(),
            child: Container(color: Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: ListView.builder(
              itemCount: widget.items.length,
              itemBuilder: (context, index) => CustomDrawerItem(
                onSelected: () => setState(() => selectedIndex = index),
                icon: widget.items[index].icon,
                title: widget.items[index].title,
                isSelected: selectedIndex == index,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
