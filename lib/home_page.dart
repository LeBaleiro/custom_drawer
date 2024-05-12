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
  int selectedIndex = 1;
  Size? selectedItemSize;

  // final animationCurve = Curves.ease;
  late final Map<GlobalKey, ({Widget icon, Widget title})> items = {
    for (var element in widget.items) GlobalKey(): element
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        final currentKey = items.keys.toList()[selectedIndex];
        setState(() => selectedItemSize = currentKey.currentContext?.size);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerBackground(
            selectedIndex: selectedIndex,
            selectedItemSize: selectedItemSize,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => CustomDrawerItem(
                key: items.keys.toList()[index],
                onSelected: () => setState(() => selectedIndex = index),
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
