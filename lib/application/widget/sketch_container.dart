import 'package:bitti/application/widget/sketch_painters/sketch_painter_rectangle_fill.dart';
import 'package:bitti/application/widget/sketch_painters/sketch_painter_rectangle_stroke.dart';
import 'package:flutter/material.dart';

class SketchContainer extends StatelessWidget {
  final EdgeInsets? padding;
  final Color? strokeColor;
  final Color? fillColor;
  final bool? lineFilledBackground;
  final double? embossSize;
  final Color? embossColor;

  final Widget? child;

  const SketchContainer({
    super.key,
    this.padding,
    this.strokeColor,
    this.fillColor,
    this.embossSize,
    this.embossColor,
    this.lineFilledBackground,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SketchPainterRectangleFill(
        key: UniqueKey(),
        color: fillColor ?? Theme.of(context).colorScheme.surfaceContainer,
        isLineFill: lineFilledBackground ?? false,
        embossSize: embossSize,
        embossColor: embossColor,
      ),
      child: CustomPaint(
        painter: SketchPainterRectangleStroke(
          key: UniqueKey(),
          boxEmbossSize: embossSize,
          color: strokeColor ?? Theme.of(context).colorScheme.outline,
        ),
        child: Padding(
          padding: combinePaddingWithEmboss(padding, embossSize),
          child: child,
        ),
      ),
    );
  }

  EdgeInsets combinePaddingWithEmboss(EdgeInsets? padding, double? embossSize) {
    if (embossSize == null || embossSize == 0) {
      return padding ?? EdgeInsets.zero;
    }
    return EdgeInsets.fromLTRB(
      padding?.left ?? 0,
      padding?.top ?? 0,
      (padding?.right ?? 0) + embossSize,
      (padding?.bottom ?? 0) + embossSize,
    );
  }
}
