import 'package:flutter/material.dart';
import 'dart:math';

class CircleSendingProgress extends CustomPainter {
  double currentProgress;
  CircleSendingProgress(this.currentProgress);
  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCircle = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.white
      ..strokeWidth = 7;

    Paint completeArc = Paint()
      ..style = PaintingStyle.stroke
      ..color = Color(0xFFE4582E)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 7;

    Offset offset = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 7;
    canvas.drawCircle(offset, radius, outerCircle);

    double angle = 2 * pi * (currentProgress / 100);

    canvas.drawArc(Rect.fromCircle(center: offset, radius: radius), -pi / 2,
        angle, false, completeArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
