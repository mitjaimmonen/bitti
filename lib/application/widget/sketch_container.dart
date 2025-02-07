import 'package:bitti/application/widget/sketch_painters/sketch_painter_rectangle_fill.dart';
import 'package:bitti/application/widget/sketch_painters/sketch_painter_rectangle_stroke.dart';
import 'package:flutter/material.dart';

class SketchContainer extends StatelessWidget {
  final EdgeInsets? padding;
  final Color? strokeColor;
  final Color? fillColor;
  final bool? lineFilledBackground;
  final double? elevation;
  final Color? elevationColor;

  final Widget? child;

  const SketchContainer({
    super.key,
    this.padding,
    this.strokeColor,
    this.fillColor,
    this.elevation,
    this.elevationColor,
    this.lineFilledBackground,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SketchPainterRectangleFill(
        key: UniqueKey(),
        color: fillColor ?? Theme.of(context).colorScheme.surfaceBright,
        isLineFill: lineFilledBackground ?? false,
        elevation: elevation,
        elevationColor: elevationColor ??
            Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      child: CustomPaint(
        painter: SketchPainterRectangleStroke(
          key: UniqueKey(),
          elevation: elevation,
          color: strokeColor ?? Theme.of(context).colorScheme.outline,
        ),
        child: Padding(
          padding: combinePaddingWithEmboss(padding, elevation),
          child: child,
        ),
      ),
    );
  }

  EdgeInsets combinePaddingWithEmboss(EdgeInsets? padding, double? elevation) {
    if (elevation == null || elevation == 0) {
      return padding ?? EdgeInsets.zero;
    }
    if (elevation > 0) {
      return EdgeInsets.fromLTRB(
        padding?.left ?? 0,
        padding?.top ?? 0,
        (padding?.right ?? 0) + elevation,
        (padding?.bottom ?? 0) + elevation,
      );
    } else {
      return EdgeInsets.fromLTRB(
        (padding?.left ?? 0) - elevation,
        (padding?.top ?? 0) - elevation,
        padding?.right ?? 0,
        padding?.bottom ?? 0,
      );
    }
  }
}
