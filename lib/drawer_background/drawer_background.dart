import 'package:custom_drawer/clipper_shadow_path.dart';
import 'package:custom_drawer/my_custom_clipper.dart';
import 'package:flutter/material.dart';

class DrawerBackground extends StatefulWidget {
  const DrawerBackground({
    super.key,
    required this.selectedItemSize,
    required this.selectedItemPosition,
  });
  final Size? selectedItemSize;
  final Offset? selectedItemPosition;

  @override
  State<DrawerBackground> createState() => _DrawerBackgroundState();
}

class _DrawerBackgroundState extends State<DrawerBackground>
    with SingleTickerProviderStateMixin {
  late Size? selectedItemSize = widget.selectedItemSize;
  late Offset? selectedItemPosition = widget.selectedItemPosition;

  late Animation<double> animation = Tween<double>(
    begin: 0,
    end: 0,
  ).animate(controller);

  late final AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  double get cutHeight => selectedItemSize?.height ?? 0;
  double get yStartPoint => selectedItemPosition?.dy ?? 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        animation = Tween<double>(begin: yStartPoint, end: yStartPoint)
            .animate(controller);
        controller.forward();
      }
    });
  }

  @override
  void didUpdateWidget(covariant DrawerBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedItemPosition != widget.selectedItemPosition) {
      final lastStartPoint = yStartPoint;
      setState(() => selectedItemPosition = widget.selectedItemPosition);
      controller.reset();
      animation = Tween<double>(begin: lastStartPoint, end: yStartPoint)
          .animate(controller);
      controller.forward();
    }
    if (oldWidget.selectedItemSize != widget.selectedItemSize) {
      setState(() => selectedItemSize = widget.selectedItemSize);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, widget) {
        return ClipperShadowPath(
          clipper: MyCustomClipper(
            cutHeight: cutHeight,
            yStartPoint: animation.value,
          ),
          shadow: Shadow(
            color: Colors.grey.shade500,
            offset: const Offset(0, 1),
            blurRadius: 10,
          ),
          child: Container(color: Colors.blue),
        );
      },
    );
  }
}
