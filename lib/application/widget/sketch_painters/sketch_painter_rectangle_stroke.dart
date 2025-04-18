import 'dart:math';

import 'package:flutter/material.dart';

class SketchPainterRectangleStroke extends CustomPainter {
  final Key key;
  final Color color;
  final double elevation;
  final double radius;
  late Random random;

  (Paint, Path, Size)? cache;

  SketchPainterRectangleStroke({
    required this.key,
    required this.color,
    double? radius,
    double? elevation,
  })  : elevation = elevation ?? 0,
        radius = radius ?? 0;

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

    final adjustedRadius = radius.clamp(0.0, min(size.width, size.height) / 2);

    if (elevation > 0) {
      for (int i = 0; i < 2; i++) {
        // Draw box with rounded corners
        path.moveTo(adjustedRadius, 0);
        sketchLine(
          Offset(adjustedRadius, 0),
          Offset(size.width - elevation - adjustedRadius, 0),
          path,
        );
        sketchCurve(
          Offset(size.width - elevation - adjustedRadius, 0),
          Offset(size.width - elevation, 0),
          Offset(size.width - elevation, adjustedRadius),
          path,
        );
        sketchLine(
          Offset(size.width - elevation, adjustedRadius),
          Offset(
              size.width - elevation, size.height - elevation - adjustedRadius),
          path,
        );
        sketchCurve(
          Offset(
              size.width - elevation, size.height - elevation - adjustedRadius),
          Offset(size.width - elevation, size.height - elevation),
          Offset(
              size.width - elevation - adjustedRadius, size.height - elevation),
          path,
        );
        sketchLine(
          Offset(
              size.width - elevation - adjustedRadius, size.height - elevation),
          Offset(adjustedRadius, size.height - elevation),
          path,
        );
        sketchCurve(
          Offset(adjustedRadius, size.height - elevation),
          Offset(0, size.height - elevation),
          Offset(0, size.height - elevation - adjustedRadius),
          path,
        );
        sketchLine(
          Offset(0, size.height - elevation - adjustedRadius),
          Offset(0, adjustedRadius),
          path,
        );
        sketchCurve(
          Offset(0, adjustedRadius),
          Offset(0, 0),
          Offset(adjustedRadius, 0),
          path,
        );

        // Draw emboss for positive elevation (3D box effect on bottom and right)
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
        // Draw bottom right corner emboss only if radius is zero
        if (radius == 0) {
          path.moveTo(size.width - elevation, size.height - elevation);
          sketchLine(
            Offset(size.width - elevation, size.height - elevation),
            Offset(size.width, size.height),
            path,
          );
        }
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
        // Draw box with rounded corners
        path.moveTo(adjustedRadius - elevation, -elevation);
        sketchLine(
          Offset(adjustedRadius - elevation, -elevation),
          Offset(size.width - adjustedRadius, -elevation),
          path,
        );
        sketchCurve(
          Offset(size.width - adjustedRadius, -elevation),
          Offset(size.width, -elevation),
          Offset(size.width, adjustedRadius - elevation),
          path,
        );
        sketchLine(
          Offset(size.width, adjustedRadius - elevation),
          Offset(size.width, size.height - adjustedRadius),
          path,
        );
        sketchCurve(
          Offset(size.width, size.height - adjustedRadius),
          Offset(size.width, size.height),
          Offset(size.width - adjustedRadius, size.height),
          path,
        );
        sketchLine(
          Offset(size.width - adjustedRadius, size.height),
          Offset(adjustedRadius - elevation, size.height),
          path,
        );
        sketchCurve(
          Offset(adjustedRadius - elevation, size.height),
          Offset(-elevation, size.height),
          Offset(-elevation, size.height - adjustedRadius),
          path,
        );
        sketchLine(
          Offset(-elevation, size.height - adjustedRadius),
          Offset(-elevation, adjustedRadius - elevation),
          path,
        );
        sketchCurve(
          Offset(-elevation, adjustedRadius - elevation),
          Offset(-elevation, -elevation),
          Offset(adjustedRadius - elevation, -elevation),
          path,
        );

        // Draw emboss for negative elevation (hole effect)
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
        // Draw top-left corner emboss only if radius is zero
        if (radius == 0) {
          sketchLine(
            Offset(-elevation, -elevation),
            Offset(0, 0),
            path,
          );
        }
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
        // Draw box with rounded corners
        path.moveTo(adjustedRadius, 0);
        sketchLine(
          Offset(adjustedRadius, 0),
          Offset(size.width - adjustedRadius, 0),
          path,
        );
        sketchCurve(
          Offset(size.width - adjustedRadius, 0),
          Offset(size.width, 0),
          Offset(size.width, adjustedRadius),
          path,
        );
        sketchLine(
          Offset(size.width, adjustedRadius),
          Offset(size.width, size.height - adjustedRadius),
          path,
        );
        sketchCurve(
          Offset(size.width, size.height - adjustedRadius),
          Offset(size.width, size.height),
          Offset(size.width - adjustedRadius, size.height),
          path,
        );
        sketchLine(
          Offset(size.width - adjustedRadius, size.height),
          Offset(adjustedRadius, size.height),
          path,
        );
        sketchCurve(
          Offset(adjustedRadius, size.height),
          Offset(0, size.height),
          Offset(0, size.height - adjustedRadius),
          path,
        );
        sketchLine(
          Offset(0, size.height - adjustedRadius),
          Offset(0, adjustedRadius),
          path,
        );
        sketchCurve(
          Offset(0, adjustedRadius),
          Offset(0, 0),
          Offset(adjustedRadius, 0),
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

  void sketchCurve(Offset start, Offset control, Offset end, Path path) {
    path.moveTo(start.dx, start.dy);
    path.quadraticBezierTo(
      control.dx,
      control.dy,
      end.dx,
      end.dy,
    );
  }
}
