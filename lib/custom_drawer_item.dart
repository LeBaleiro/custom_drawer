import 'package:flutter/material.dart';

class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem({
    super.key,
    required this.onSelected,
    required this.isSelected,
    required this.icon,
    required this.title,
  });

  final VoidCallback onSelected;
  final bool isSelected;
  final Widget icon;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onSelected,
      child: ListTile(
        leading: IconTheme(
          data: IconThemeData(
            color: isSelected ? Colors.blue : Colors.white,
          ),
          child: icon,
        ),
        title: DefaultTextStyle(
          style: TextStyle(
            color: isSelected ? Colors.blue : Colors.white,
          ),
          child: title,
        ),
      ),
    );
  }
}
