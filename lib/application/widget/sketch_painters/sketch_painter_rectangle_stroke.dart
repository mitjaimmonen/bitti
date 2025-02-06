import 'dart:math';

import 'package:flutter/material.dart';

class SketchPainterRectangleStroke extends CustomPainter {
  final Key key;
  final Color color;

  SketchPainterRectangleStroke({
    required this.key,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = color
      ..strokeWidth = 1.2
      ..strokeCap = StrokeCap.round;

    final path = Path()..moveTo(0, 0);

    for (int i = 0; i < 2; i++) {
      sketchLine(Offset(0, 0), Offset(size.width, 0), path);
      sketchLine(Offset(size.width, 0), Offset(size.width, size.height), path);
      sketchLine(Offset(size.width, size.height), Offset(0, size.height), path);
      sketchLine(Offset(0, size.height), Offset(0, 0), path);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void sketchLine(Offset start, Offset end, Path path) {
    final pointCount = ((start - end).distance / 100).ceil();
    final step = 1 / pointCount;
    final random = Random(key.hashCode);

    final List<Offset> points = [];

    for (var i = 0; i < pointCount; i++) {
      final t = i * step;
      final x = start.dx + (end.dx - start.dx) * t;
      final y = start.dy + (end.dy - start.dy) * t;
      final randomX = (random.nextDouble() - 0.5) * 4 + x;
      final randomY = (random.nextDouble() - 0.5) * 4 + y;
      points.add(Offset(randomX, randomY));
    }

    for (var i = 0; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
  }
}
