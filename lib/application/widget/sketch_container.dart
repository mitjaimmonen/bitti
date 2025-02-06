import 'package:bitti/application/widget/sketch_painters/sketch_painter_rectangle_fill.dart';
import 'package:bitti/application/widget/sketch_painters/sketch_painter_rectangle_stroke.dart';
import 'package:flutter/material.dart';

class SketchContainer extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Color? strokeColor;
  final Color? fillColor;
  final bool dashedBackground;

  final Widget? child;

  const SketchContainer({
    super.key,
    this.padding,
    this.strokeColor,
    this.fillColor,
    this.dashedBackground = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SketchPainterRectangleFill(
        key: UniqueKey(),
        color: fillColor ?? Theme.of(context).colorScheme.surfaceContainer,
        isDashed: dashedBackground,
      ),
      child: CustomPaint(
        painter: SketchPainterRectangleStroke(
          key: UniqueKey(),
          color: strokeColor ?? Theme.of(context).colorScheme.outline,
        ),
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}
