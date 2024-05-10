import 'dart:math';

import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1
    double degToRad(num deg) => deg * (pi / 180.0);

    const drawerWidth = 0.5;
    const xCutStartPoint = 0.2;
    const yCutStartPoint = 0.2;
    const cutHeight = 0.13;
    const radiusHelper = .03;

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.0
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.lineTo(size.width * drawerWidth, size.height * 0);
    path_0.lineTo(size.width * drawerWidth,
        size.height * (yCutStartPoint - radiusHelper));
    path_0.quadraticBezierTo(
      size.width * drawerWidth,
      size.height * yCutStartPoint,
      size.width * (drawerWidth - radiusHelper),
      size.height * yCutStartPoint,
    );
    path_0.lineTo(size.width * (xCutStartPoint + radiusHelper),
        size.height * yCutStartPoint);
    path_0.quadraticBezierTo(
      size.width * xCutStartPoint,
      size.height * yCutStartPoint,
      size.width * xCutStartPoint,
      size.height * (yCutStartPoint + radiusHelper),
    );
    path_0.lineTo(size.width * xCutStartPoint,
        size.height * (yCutStartPoint + cutHeight - radiusHelper));
    path_0.quadraticBezierTo(
      size.width * xCutStartPoint,
      size.height * (yCutStartPoint + cutHeight),
      size.width * (xCutStartPoint + radiusHelper),
      size.height * (yCutStartPoint + cutHeight),
    );
    path_0.lineTo(size.width * (drawerWidth - radiusHelper),
        size.height * (yCutStartPoint + cutHeight));
    path_0.quadraticBezierTo(
      size.width * drawerWidth,
      size.height * (yCutStartPoint + cutHeight),
      size.width * drawerWidth,
      size.height * (yCutStartPoint + cutHeight + radiusHelper),
    );
    path_0.lineTo(size.width * drawerWidth, size.height);
    path_0.lineTo(size.width * 0, size.height * 1);
    path_0.lineTo(size.width * 0, size.height * 0);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
