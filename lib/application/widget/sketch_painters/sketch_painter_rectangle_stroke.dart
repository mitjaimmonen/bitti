import 'dart:math';

import 'package:flutter/material.dart';

class SketchPainterRectangleStroke extends CustomPainter {
  final Key key;
  final Color color;
  final double elevation;
  late Random random;

  (Paint, Path, Size)? cache;

  SketchPainterRectangleStroke({
    required this.key,
    required this.color,
    double? elevation,
  }) : elevation = elevation ?? 0;

  @override
  void paint(Canvas canvas, Size size) {
    if (cache != null) {
      final (paint, path, cacheSize) = cache!;
      if (cacheSize != size) {
        cache = null;
      } else {
        canvas.drawPath(path, paint);
      }

      if (cache != null) return;
    }

    random = Random(key.hashCode);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = color
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    final path = Path();

    if (elevation > 0) {
      for (int i = 0; i < 2; i++) {
        // Draw box
        path.moveTo(0, 0);
        sketchLine(
          Offset(0, 0),
          Offset(size.width - elevation, 0),
          path,
        );
        sketchLine(
          Offset(size.width - elevation, 0),
          Offset(size.width - elevation, size.height - elevation),
          path,
        );
        sketchLine(
          Offset(size.width - elevation, size.height - elevation),
          Offset(0, size.height - elevation),
          path,
        );
        sketchLine(
          Offset(0, size.height - elevation),
          Offset(0, 0),
          path,
        );

        // Draw emboss
        path.moveTo(size.width - elevation, 0);
        sketchLine(
          Offset(size.width - elevation, 0),
          Offset(size.width, elevation),
          path,
        );
        sketchLine(
          Offset(size.width, elevation),
          Offset(size.width, size.height),
          path,
        );
        path.moveTo(size.width - elevation, size.height - elevation);
        sketchLine(
          Offset(size.width - elevation, size.height - elevation),
          Offset(size.width, size.height),
          path,
        );
        sketchLine(
          Offset(size.width, size.height),
          Offset(elevation, size.height),
          path,
        );
        sketchLine(
          Offset(elevation, size.height),
          Offset(0, size.height - elevation),
          path,
        );
      }
    } else if (elevation < 0) {
      for (int i = 0; i < 2; i++) {
        // Draw box
        path.moveTo(-elevation, -elevation);
        sketchLine(
          Offset(-elevation, -elevation),
          Offset(size.width, -elevation),
          path,
        );
        sketchLine(
          Offset(size.width, -elevation),
          Offset(size.width, size.height),
          path,
        );
        sketchLine(
          Offset(size.width, size.height),
          Offset(-elevation, size.height),
          path,
        );
        sketchLine(
          Offset(-elevation, size.height),
          Offset(-elevation, -elevation),
          path,
        );

        // Draw emboss
        path.moveTo(-elevation, size.height);
        sketchLine(
          Offset(-elevation, size.height),
          Offset(0, size.height),
          path,
        );
        sketchLine(
          Offset(0, size.height),
          Offset(0, 0),
          path,
        );
        path.moveTo(-elevation, -elevation);
        sketchLine(
          Offset(-elevation, -elevation),
          Offset(0, 0),
          path,
        );
        sketchLine(
          Offset(0, 0),
          Offset(size.width, 0),
          path,
        );
        sketchLine(
          Offset(size.width, 0),
          Offset(size.width, -elevation),
          path,
        );
      }
    } else {
      for (int i = 0; i < 2; i++) {
        // Draw box
        path.moveTo(0, 0);
        sketchLine(
          Offset(0, 0),
          Offset(size.width, 0),
          path,
        );
        sketchLine(
          Offset(size.width, 0),
          Offset(size.width, size.height),
          path,
        );
        sketchLine(
          Offset(size.width, size.height),
          Offset(0, size.height),
          path,
        );
        sketchLine(
          Offset(0, size.height),
          Offset(0, 0),
          path,
        );
      }
    }

    canvas.drawPath(path, paint);
    cache = (paint, path, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void sketchLine(Offset start, Offset end, Path path) {
    final pointCount = ((start - end).distance / 100).ceil();
    final step = 1 / pointCount;

    final List<Offset> points = [];

    for (var i = 0; i < pointCount; i++) {
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
