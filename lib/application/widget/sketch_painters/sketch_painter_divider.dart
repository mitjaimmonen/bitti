import 'dart:math';

import 'package:flutter/cupertino.dart';

class SketchPainterDivider extends CustomPainter {
  final Key key;
  final Color strokeColor;
  final double strokeThickness;
  final Axis axis;
  late Random random;

  SketchPainterDivider({
    required this.key,
    required this.strokeColor,
    required this.strokeThickness,
    required this.axis,
  });

  @override
  void paint(Canvas canvas, Size size) {
    random = Random(key.hashCode);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = strokeColor
      ..strokeWidth = strokeThickness
      ..strokeCap = StrokeCap.round;

    final path = Path();

    for (int i = 0; i < 2; i++) {
      if (axis == Axis.horizontal) {
        sketchLine(
          Offset(0, size.height / 2),
          Offset(size.width, size.height / 2),
          path,
        );
      } else {
        sketchLine(
          Offset(size.width / 2, 0),
          Offset(size.width / 2, size.height),
          path,
        );
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void sketchLine(Offset start, Offset end, Path path) {
    final pointCount = ((start - end).distance / 100).ceil();
    final step = 1 / pointCount;

    final List<Offset> points = [];
    path.moveTo(start.dx, start.dy);

    for (var i = 1; i < pointCount; i++) {
      final t = i * step;
      final x = start.dx + (end.dx - start.dx) * t;
      final y = start.dy + (end.dy - start.dy) * t;
      final randomX = (random.nextDouble() * 2 - 1) * 1.5 + x;
      final randomY = (random.nextDouble() * 2 - 1) * 1.5 + y;
      points.add(Offset(randomX, randomY));
    }

    points.add(end);

    for (var i = 0; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
  }
}
