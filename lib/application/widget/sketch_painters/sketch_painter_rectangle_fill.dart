import 'dart:math';

import 'package:flutter/material.dart';

class SketchPainterRectangleFill extends CustomPainter {
  final Color color;
  final bool isDashed;

  SketchPainterRectangleFill({
    required this.color,
    required this.isDashed,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final points = [
      randomizePoint(0, 0),
      randomizePoint(size.width, 0),
      randomizePoint(size.width, size.height),
      randomizePoint(0, size.height),
    ];

    final path = Path()
      ..moveTo(points[0].$1, points[0].$2)
      ..lineTo(points[1].$1, points[1].$2)
      ..lineTo(points[2].$1, points[2].$2)
      ..lineTo(points[3].$1, points[3].$2)
      ..lineTo(points[0].$1, points[0].$2);

    canvas.drawPath(path, paint);
  }

  (double, double) randomizePoint(double x, double y) {
    final random = Random();
    final randomX = (random.nextDouble() - 0.5) * 8 + x;
    final randomY = (random.nextDouble() - 0.5) * 8 + y;
    return (randomX, randomY);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
