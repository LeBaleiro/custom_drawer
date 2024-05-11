// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  MyCustomClipper({required this.yStartPoint, required this.cutHeight});

  final double yStartPoint;
  final double cutHeight;
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

  @override
  Path getClip(Size size) {
    const drawerWidth = 0.26;
    const xCutStartPoint = 0.019;
    const radiusHelperX = .01;
    const radiusHelperY = 10;

    final path = Path();
    path.lineTo(size.width * drawerWidth, size.height * 0);
    path.lineTo(
      size.width * drawerWidth,
      yStartPoint - radiusHelperY,
    );

    path.quadraticBezierTo(
      size.width * drawerWidth,
      yStartPoint,
      size.width * (drawerWidth - radiusHelperX),
      yStartPoint,
    );
    path.lineTo(size.width * (xCutStartPoint + radiusHelperX), yStartPoint);
    path.quadraticBezierTo(
      size.width * xCutStartPoint,
      yStartPoint,
      size.width * xCutStartPoint,
      yStartPoint + radiusHelperY,
    );
    path.lineTo(
        size.width * xCutStartPoint, (yStartPoint + cutHeight - radiusHelperY));
    path.quadraticBezierTo(
      size.width * xCutStartPoint,
      (yStartPoint + cutHeight),
      size.width * (xCutStartPoint + radiusHelperX),
      (yStartPoint + cutHeight),
    );
    path.lineTo(
        size.width * (drawerWidth - radiusHelperX), (yStartPoint + cutHeight));
    path.quadraticBezierTo(
      size.width * drawerWidth,
      (yStartPoint + cutHeight),
      size.width * drawerWidth,
      (yStartPoint + cutHeight + radiusHelperY),
    );
    path.lineTo(size.width * drawerWidth, size.height);
    path.lineTo(size.width * 0, size.height * 1);
    path.lineTo(size.width * 0, size.height * 0);
    path.close();

    return path;
  }
}
