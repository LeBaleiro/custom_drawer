import 'package:custom_drawer/custom_drawer_item.dart';
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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 1;
  Size? selectedItemSize;

  final animationCurve = Curves.ease;
  late Animation<double> animation =
      Tween<double>(begin: 0, end: 0).animate(controller);
  late final AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

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
        animation = Tween<double>(
          begin: yStartPoint,
          end: yStartPoint,
        ).animate(controller);
        controller.forward();
      }
    });
  }

  double get cutHeight => selectedItemSize?.height ?? 0;
  double get yStartPoint => selectedIndex * (selectedItemSize?.height ?? 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: animation,
            builder: (context, widget) {
              return ClipperShadowPath(
                clipper: MyCustomClipper(
                  cutHeight: cutHeight,
                  yStartPoint: animation.value,
                ),
                shadow: const Shadow(
                  color: Colors.black,
                  offset: Offset(3.0, 3.0),
                  blurRadius: 1.3,
                ),
                child: Container(color: Colors.blue),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => CustomDrawerItem(
                key: items.keys.toList()[index],
                onSelected: () {
                  final lastStartPoint = yStartPoint;
                  setState(() => selectedIndex = index);
                  controller.reset();
                  animation =
                      Tween<double>(begin: lastStartPoint, end: yStartPoint)
                          .animate(controller);
                  controller.forward();
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
