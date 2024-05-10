import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const drawerWidth = 0.5;
    const xCutStartPoint = 0.2;
    const yCutStartPoint = 0.2;
    const cutHeight = 0.07;
    const radiusHelper = .01;

    final paint = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.0
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

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

    canvas.drawPath(path, paint);

    final paintStroke = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path, paintStroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
