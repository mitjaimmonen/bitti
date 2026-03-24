import 'dart:math';
import 'dart:ui';

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
      for (int i = 0; i < 1; i++) {
        elevatedRectangle(
          path,
          size,
          elevation,
          adjustedRadius,
        );

        elevatedEmboss(
          path,
          size,
          elevation,
          adjustedRadius,
        );
      }
    } else if (elevation < 0) {
      for (int i = 0; i < 2; i++) {
        defaultRectangle(
          path,
          size,
          adjustedRadius,
        );

        negativeEmboss(
          path,
          size,
          -elevation,
          adjustedRadius,
        );
      }
    } else {
      for (int i = 0; i < 2; i++) {
        defaultRectangle(
          path,
          size,
          adjustedRadius,
        );
      }
    }

    canvas.drawPath(path, paint);
    cache = (paint, path, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void elevatedRectangle(
    Path path,
    Size size,
    double elevation,
    double adjustedRadius,
  ) {
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
      Offset(size.width - elevation, size.height - elevation - adjustedRadius),
      path,
    );
    sketchCurve(
      Offset(size.width - elevation, size.height - elevation - adjustedRadius),
      Offset(size.width - elevation, size.height - elevation),
      Offset(size.width - elevation - adjustedRadius, size.height - elevation),
      path,
    );
    sketchLine(
      Offset(size.width - elevation - adjustedRadius, size.height - elevation),
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
  }

  void defaultRectangle(Path path, Size size, double adjustedRadius) {
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

  void elevatedEmboss(
    Path path,
    Size size,
    double elevation,
    double adjustedRadius,
  ) {
    // Draw emboss for positive elevation (3D box effect on bottom and right)
    final topRightOffset = elevation > adjustedRadius
        ? Offset.zero
        : calculateControlOffset(
            Offset(size.width - elevation - adjustedRadius, 0),
            Offset(size.width - elevation, 0),
            Offset(size.width - elevation, adjustedRadius),
            t: lerpDouble(
              0,
              1,
              0.5,
            )!,
          );

    path.moveTo(size.width - elevation + topRightOffset.dx, topRightOffset.dy);
    sketchLine(
      Offset(size.width - elevation + topRightOffset.dx, topRightOffset.dy),
      Offset(size.width + topRightOffset.dx, elevation + topRightOffset.dy),
      path,
    );
    drawBezierSegment(
      path,
      Offset(size.width - adjustedRadius, elevation),
      Offset(size.width, elevation),
      Offset(size.width, elevation + adjustedRadius),
      0.5,
    );
    sketchLine(
      Offset(size.width, elevation + adjustedRadius),
      Offset(size.width, size.height - adjustedRadius),
      path,
    );
    sketchCurve(
      Offset(size.width, size.height - adjustedRadius),
      Offset(size.width, size.height),
      Offset(size.width - adjustedRadius, size.height),
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
      Offset(size.width - adjustedRadius, size.height),
      Offset(elevation + adjustedRadius, size.height),
      path,
    );
    final start = drawBezierSegment(
      path,
      Offset(elevation, size.height - adjustedRadius),
      Offset(elevation, size.height),
      Offset(elevation + adjustedRadius, size.height),
      0.5,
    );

    final bottomLeftOffset = elevation > adjustedRadius
        ? Offset.zero
        : calculateControlOffset(
            Offset(elevation, size.height - adjustedRadius),
            Offset(elevation, size.height),
            Offset(elevation + adjustedRadius, size.height),
            t: lerpDouble(
              0,
              1,
              0.5,
            )!,
          );
    path.moveTo(start.dx, start.dy);
    sketchLine(
      Offset(start.dx, start.dy),
      Offset(
          bottomLeftOffset.dx, size.height - elevation + bottomLeftOffset.dy),
      path,
    );
  }

  void negativeEmboss(
    Path path,
    Size size,
    double depth,
    double adjustedRadius,
  ) {
    // Draw emboss for negative elevation (hole effect)
    if (depth < adjustedRadius) {
      drawBezierSegment(
        path,
        Offset(depth + adjustedRadius, size.height + depth),
        Offset(depth, size.height + depth),
        Offset(depth, size.height + depth - adjustedRadius),
        lerpDouble(0, 1, depth / adjustedRadius)!,
      );
    }

    path.moveTo(depth, size.height);

    sketchLine(
      Offset(depth, size.height + depth - adjustedRadius),
      Offset(depth, depth + adjustedRadius),
      path,
    );
    sketchCurve(
      Offset(depth, depth + adjustedRadius),
      Offset(depth, depth),
      Offset(depth + adjustedRadius, depth),
      path,
    );

    sketchLine(
      Offset(depth + adjustedRadius, depth),
      Offset(size.width - adjustedRadius, depth),
      path,
    );

    path.moveTo(size.width, depth + adjustedRadius);

    drawBezierSegment(
      path,
      Offset(size.width, depth + adjustedRadius),
      Offset(size.width, depth),
      Offset(size.width - adjustedRadius, depth),
      lerpDouble(0, 1, clampDouble(depth / adjustedRadius,0,1))!,
    );

    // Draw top-left corner emboss only if radius is zero
    if (radius == 0) {
      path.moveTo(depth, depth);
      sketchLine(
        Offset(depth, depth),
        Offset(0, 0),
        path,
      );
    }
  }

  void sketchLine(Offset start, Offset end, Path path) {
    final pointCount = ((start - end).distance / 100).ceil();
    final step = 1 / pointCount;

    final List<Offset> points = [];

    points.add(start);

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

  void sketchCurve(Offset start, Offset control, Offset end, Path path) {
    path.moveTo(start.dx, start.dy);
    path.quadraticBezierTo(
      (random.nextDouble() * 2 - 1) * 1.5 + control.dx,
      (random.nextDouble() * 2 - 1) * 1.5 + control.dy,
      end.dx,
      end.dy,
    );
  }

  Offset calculateControlOffset(
    Offset start,
    Offset control,
    Offset end, {
    double t = 0.5,
  }) {
    // Calculate the point on the Bézier curve at t
    final pointAtT = Offset(
      (1 - t) * (1 - t) * start.dx +
          2 * (1 - t) * t * control.dx +
          t * t * end.dx,
      (1 - t) * (1 - t) * start.dy +
          2 * (1 - t) * t * control.dy +
          t * t * end.dy,
    );

    // Calculate the offset from the control point to the point at t
    return pointAtT - control;
  }

  Offset drawBezierSegment(
      Path path, Offset start, Offset control, Offset end, double startT) {
    // Helper function to calculate a point on the Bézier curve at a given t
    Offset calculatePoint(double t) {
      final p0Prime = Offset(
        (1 - t) * start.dx + t * control.dx,
        (1 - t) * start.dy + t * control.dy,
      );

      final p1Prime = Offset(
        (1 - t) * control.dx + t * end.dx,
        (1 - t) * control.dy + t * end.dy,
      );

      return Offset(
        (1 - t) * p0Prime.dx + t * p1Prime.dx,
        (1 - t) * p0Prime.dy + t * p1Prime.dy,
      );
    }

    // Calculate the points at startT and endT
    final pointStart = calculatePoint(startT);

    // Calculate the control point for the segment
    final controlSegment = Offset(
      (1 - startT) * control.dx + startT * end.dx,
      (1 - startT) * control.dy + startT * end.dy,
    );

    // Create a path for the segment
    path.moveTo(pointStart.dx, pointStart.dy);
    path.quadraticBezierTo(
      controlSegment.dx,
      controlSegment.dy,
      end.dx,
      end.dy,
    );

    return pointStart;
  }
}
