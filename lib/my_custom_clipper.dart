import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

  @override
  Path getClip(Size size) {
    const drawerWidth = 0.26;
    const xCutStartPoint = 0.019;
    const yCutStartPoint = 0.085;
    const cutHeight = 0.07;
    const radiusHelper = .01;

    final path = Path();
    path.lineTo(size.width * drawerWidth, size.height * 0);
    path.lineTo(size.width * drawerWidth,
        size.height * (yCutStartPoint - radiusHelper));

    path.quadraticBezierTo(
      size.width * drawerWidth,
      size.height * yCutStartPoint,
      size.width * (drawerWidth - radiusHelper),
      size.height * yCutStartPoint,
    );
    path.lineTo(size.width * (xCutStartPoint + radiusHelper),
        size.height * yCutStartPoint);
    path.quadraticBezierTo(
      size.width * xCutStartPoint,
      size.height * yCutStartPoint,
      size.width * xCutStartPoint,
      size.height * (yCutStartPoint + radiusHelper),
    );
    path.lineTo(size.width * xCutStartPoint,
        size.height * (yCutStartPoint + cutHeight - radiusHelper));
    path.quadraticBezierTo(
      size.width * xCutStartPoint,
      size.height * (yCutStartPoint + cutHeight),
      size.width * (xCutStartPoint + radiusHelper),
      size.height * (yCutStartPoint + cutHeight),
    );
    path.lineTo(size.width * (drawerWidth - radiusHelper),
        size.height * (yCutStartPoint + cutHeight));
    path.quadraticBezierTo(
      size.width * drawerWidth,
      size.height * (yCutStartPoint + cutHeight),
      size.width * drawerWidth,
      size.height * (yCutStartPoint + cutHeight + radiusHelper),
    );
    path.lineTo(size.width * drawerWidth, size.height);
    path.lineTo(size.width * 0, size.height * 1);
    path.lineTo(size.width * 0, size.height * 0);
    path.close();

    return path;
  }
}
