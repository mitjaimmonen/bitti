import 'dart:math';

import 'package:flutter/material.dart';

class SketchPainterRectangleStroke extends CustomPainter {
  final Key key;
  final Color color;
  final double embossSize;

  SketchPainterRectangleStroke({
    required this.key,
    required this.color,
    double? boxEmbossSize,
  }) : embossSize = boxEmbossSize ?? 0;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = color
      ..strokeWidth = 1.2
      ..strokeCap = StrokeCap.round;

    final path = Path()..moveTo(0, 0);

    for (int i = 0; i < 1; i++) {
      sketchLine(
        Offset(0, 0),
        Offset(size.width - embossSize, 0),
        path,
      );
      sketchLine(
        Offset(size.width - embossSize, 0),
        Offset(size.width - embossSize, size.height - embossSize),
        path,
      );
      sketchLine(
        Offset(size.width - embossSize, size.height - embossSize),
        Offset(0, size.height - embossSize),
        path,
      );
      sketchLine(
        Offset(0, size.height - embossSize),
        Offset(0, 0),
        path,
      );
    }

    if (embossSize > 0) {
      path.moveTo(size.width - embossSize, 0);
      sketchLine(
        Offset(size.width - embossSize, 0),
        Offset(size.width, embossSize),
        path,
      );
      sketchLine(
        Offset(size.width, embossSize),
        Offset(size.width, size.height),
        path,
      );
      path.moveTo(size.width - embossSize, size.height - embossSize);
      sketchLine(
        Offset(size.width - embossSize, size.height - embossSize),
        Offset(size.width, size.height),
        path,
      );
      sketchLine(
        Offset(size.width, size.height),
        Offset(embossSize, size.height),
        path,
      );
      sketchLine(
        Offset(embossSize, size.height),
        Offset(0, size.height - embossSize),
        path,
      );
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

    points.add(end);

    for (var i = 0; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
  }
}
