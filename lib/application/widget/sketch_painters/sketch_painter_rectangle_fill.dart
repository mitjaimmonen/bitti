import 'dart:math';

import 'package:flutter/material.dart';

class SketchPainterRectangleFill extends CustomPainter {
  final Key key;
  final Color color;
  final bool isDashed;

  SketchPainterRectangleFill({
    required this.key,
    required this.color,
    required this.isDashed,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final Path path = Path();

    final rectanglePoints = [
      randomizePoint(0, 0),
      randomizePoint(size.width, 0),
      randomizePoint(size.width, size.height),
      randomizePoint(0, size.height),
    ];

    if (isDashed) {
      paint.strokeWidth = 1;
      paint.strokeCap = StrokeCap.round;
      paint.style = PaintingStyle.stroke;
      final dashPoints = [
        ...addPointsAlongPath(rectanglePoints[0], rectanglePoints[1]),
        ...addPointsAlongPath(rectanglePoints[1], rectanglePoints[2]),
        ...addPointsAlongPath(rectanglePoints[2], rectanglePoints[3]),
        ...addPointsAlongPath(rectanglePoints[3], rectanglePoints[0]),
      ];

      path.moveTo(dashPoints[0].dx, dashPoints[0].dy);

      for (int i = 1; i < dashPoints.length / 2; i++) {
        path.lineTo(
          dashPoints[dashPoints.length - 1 - i].dx,
          dashPoints[dashPoints.length - 1 - i].dy,
        );
        path.lineTo(dashPoints[i].dx, dashPoints[i].dy);
      }
    } else {
      paint.style = PaintingStyle.fill;
      path.moveTo(rectanglePoints[0].dx, rectanglePoints[0].dy);
      path.lineTo(rectanglePoints[1].dx, rectanglePoints[1].dy);
      path.lineTo(rectanglePoints[2].dx, rectanglePoints[2].dy);
      path.lineTo(rectanglePoints[3].dx, rectanglePoints[3].dy);
      path.lineTo(rectanglePoints[0].dx, rectanglePoints[0].dy);
    }

    canvas.drawPath(path, paint);
  }

  Offset randomizePoint(double x, double y) {
    final random = Random(key.hashCode);
    final randomX = (random.nextDouble() - 0.5) * 8 + x;
    final randomY = (random.nextDouble() - 0.5) * 8 + y;
    return Offset(randomX, randomY);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  List<Offset> addPointsAlongPath(Offset start, Offset end) {
    final pointCount = ((start - end).distance / 4).ceil();
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

    return points;
  }
}
