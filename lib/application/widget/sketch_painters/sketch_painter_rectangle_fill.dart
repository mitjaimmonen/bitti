import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SketchPainterRectangleFill extends CustomPainter {
  final Key key;
  final Color color;
  final bool isLineFill;
  final double embossSize;
  final Color embossColor;

  late Random random;

  List<(Paint, Path)>? cache;

  SketchPainterRectangleFill({
    required this.key,
    required this.color,
    required this.isLineFill,
    double? embossSize,
    Color? embossColor,
  })  : embossSize = embossSize ?? 0,
        embossColor = embossColor ?? color;

  @override
  void paint(Canvas canvas, Size size) {
    if (cache != null) {
      for (final (paint, path) in cache!) {
        canvas.drawPath(path, paint);
      }
      if (kDebugMode) {
        // https://github.com/flutter/flutter/issues/28814
        print('Unnecessary repaint due to Flutter bug');
      }
      return;
    }

    random = Random(key.hashCode);

    final fillPaint = Paint()..color = color;
    final embossPaint = Paint()..color = embossColor;
    final Path fillPath = Path();
    final Path embossPath = Path();

    final rectanglePoints = [
      randomizePoint(0, 0),
      randomizePoint(size.width - embossSize, 0),
      randomizePoint(size.width - embossSize, size.height - embossSize),
      randomizePoint(0, size.height - embossSize),
    ];

    final embossPoints = [
      randomizePoint(size.width, embossSize),
      randomizePoint(size.width, size.height),
      randomizePoint(embossSize, size.height),
      randomizePoint(0, size.height - embossSize),
      randomizePoint(size.width - embossSize, size.height - embossSize),
      randomizePoint(size.width - embossSize, 0),
    ];

    if (isLineFill) {
      fillPaint.strokeWidth = 0.2;
      fillPaint.strokeCap = StrokeCap.round;
      fillPaint.style = PaintingStyle.stroke;

      final lineFillPoints = [
        ...addPointsAlongPath(
          rectanglePoints[0],
          rectanglePoints[1],
          randomRange: 1,
          pointInterval: 3,
        ),
        ...addPointsAlongPath(
          rectanglePoints[1],
          rectanglePoints[2],
          randomRange: 1,
          pointInterval: 3,
        ),
        ...addPointsAlongPath(
          rectanglePoints[2],
          rectanglePoints[3],
          randomRange: 1,
          pointInterval: 3,
        ),
        ...addPointsAlongPath(
          rectanglePoints[3],
          rectanglePoints[0],
          randomRange: 1,
          pointInterval: 3,
        ),
      ];

      fillPath.moveTo(lineFillPoints[0].dx, lineFillPoints[0].dy);

      for (int i = 1; i < lineFillPoints.length / 2; i++) {
        fillPath.lineTo(
          lineFillPoints[lineFillPoints.length - 1 - i].dx,
          lineFillPoints[lineFillPoints.length - 1 - i].dy,
        );
        fillPath.lineTo(lineFillPoints[i].dx, lineFillPoints[i].dy);
      }

      if (embossSize > 0) {
        embossPaint.strokeWidth = 0.2;
        embossPaint.strokeCap = StrokeCap.round;
        embossPaint.style = PaintingStyle.stroke;

        final embossFillPoints = [
          ...addPointsAlongPath(
            embossPoints[0],
            embossPoints[1],
            pointInterval: 2,
            randomRange: 0.5,
          ),
          ...addPointsAlongPath(
            embossPoints[1],
            embossPoints[2],
            pointInterval: 2,
            randomRange: 0.5,
          ),
          ...addPointsAlongPath(
            embossPoints[3],
            embossPoints[4],
            pointInterval: 2,
            randomRange: 0.5,
          ),
          ...addPointsAlongPath(
            embossPoints[4],
            embossPoints[5],
            pointInterval: 2,
            randomRange: 0.5,
          ),
        ];

        embossPath.moveTo(embossFillPoints[0].dx, embossFillPoints[0].dy);

        for (int i = 1; i < embossFillPoints.length / 2; i++) {
          if (random.nextBool()) {
            embossPath.moveTo(
              embossFillPoints[i].dx,
              embossFillPoints[i].dy,
            );
          } else {
            embossPath.lineTo(
              embossFillPoints[i].dx,
              embossFillPoints[i].dy,
            );
          }
          embossPath.lineTo(
            embossFillPoints[embossFillPoints.length - 1 - i].dx,
            embossFillPoints[embossFillPoints.length - 1 - i].dy,
          );
        }
      }
    } else {
      fillPaint.style = PaintingStyle.fill;
      fillPath.moveTo(rectanglePoints[0].dx, rectanglePoints[0].dy);
      fillPath.lineTo(rectanglePoints[1].dx, rectanglePoints[1].dy);
      fillPath.lineTo(rectanglePoints[2].dx, rectanglePoints[2].dy);
      fillPath.lineTo(rectanglePoints[3].dx, rectanglePoints[3].dy);
      fillPath.lineTo(rectanglePoints[0].dx, rectanglePoints[0].dy);

      if (embossSize > 0) {
        embossPaint.style = PaintingStyle.fill;
        embossPath.moveTo(embossPoints[0].dx, embossPoints[0].dy);
        embossPath.lineTo(embossPoints[1].dx, embossPoints[1].dy);
        embossPath.lineTo(embossPoints[2].dx, embossPoints[2].dy);
        embossPath.lineTo(embossPoints[3].dx, embossPoints[3].dy);
        embossPath.lineTo(embossPoints[4].dx, embossPoints[4].dy);
        embossPath.lineTo(embossPoints[5].dx, embossPoints[5].dy);
        embossPath.lineTo(embossPoints[0].dx, embossPoints[0].dy);
      }
    }

    canvas.drawPath(fillPath, fillPaint);
    if (embossSize > 0) {
      canvas.drawPath(embossPath, embossPaint);
    }

    cache = [
      (fillPaint, fillPath),
      if (embossSize > 0) (embossPaint, embossPath),
    ];
  }

  Offset randomizePoint(
    double x,
    double y, {
    double randomRange = 2,
  }) {
    final randomX = ((random.nextDouble() * 2) - 1) * randomRange + x;
    final randomY = ((random.nextDouble() * 2) - 1) * randomRange + y;
    return Offset(randomX, randomY);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  List<Offset> addPointsAlongPath(
    Offset start,
    Offset end, {
    double randomRange = 4,
    double pointInterval = 4,
  }) {
    final pointCount = ((start - end).distance / pointInterval).ceil();
    final step = 1 / pointCount;
    final List<Offset> points = [];

    for (var i = 0; i < pointCount; i++) {
      final t = i * step;
      final x = start.dx + (end.dx - start.dx) * t;
      final y = start.dy + (end.dy - start.dy) * t;
      final randomX = ((random.nextDouble() * 2) - 1) * randomRange + x;
      final randomY = ((random.nextDouble() * 2) - 1) * randomRange + y;
      points.add(Offset(randomX, randomY));
    }

    points.add(end);

    return points;
  }
}
