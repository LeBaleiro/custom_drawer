import 'package:custom_drawer/custom_drawer_item.dart';
import 'package:custom_drawer/drawer_background/drawer_background.dart';
import 'package:custom_drawer/my_custom_clipper.dart';
import 'package:flutter/material.dart';

import 'clipper_shadow_path.dart';

const itemPrefix = 'custom-drawer-item-';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.items});

  final List<({Widget icon, Widget title})> items;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  Offset? selectedItemPosition;
  Size? selectedItemSize;

  // final animationCurve = Curves.ease;
  late final Map<GlobalKey, ({Widget icon, Widget title})> items = {
    for (var element in widget.items) GlobalKey(): element
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => calculateItemPosition());
  }

  void calculateItemPosition() {
    if (context.mounted) {
      final currentKey = items.keys.toList()[selectedIndex];
      if (currentKey.currentContext?.findRenderObject()
          case RenderBox renderBox) {
        final position = renderBox.localToGlobal(Offset.zero);
        final size = renderBox.size;
        setState(() {
          selectedItemPosition = position;
          selectedItemSize = size;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerBackground(
            selectedItemPosition: selectedItemPosition,
            selectedItemSize: selectedItemSize,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => CustomDrawerItem(
                key: items.keys.toList()[index],
                onSelected: () {
                  setState(() => selectedIndex = index);
                  calculateItemPosition();
                },
                icon: items.entries.toList()[index].value.icon,
                title: items.entries.toList()[index].value.title,
                isSelected: selectedIndex == index,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
