import 'package:bitti/application/widget/sketch_painters/sketch_painter_divider.dart';
import 'package:flutter/material.dart';

class SketchDivider extends StatelessWidget {
  final EdgeInsets? padding;
  final Color? strokeColor;
  final double? strokeThickness;
  final Axis axis;

  const SketchDivider({
    super.key,
    this.padding,
    this.strokeColor,
    this.strokeThickness,
    Axis? axis,
  }) : axis = axis ?? Axis.horizontal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        axis == Axis.horizontal ? 0 : padding?.left ?? 0,
        axis == Axis.vertical ? 0 : padding?.top ?? 0,
        axis == Axis.horizontal ? 0 : padding?.right ?? 0,
        axis == Axis.vertical ? 0 : padding?.bottom ?? 0,
      ),
      child: CustomPaint(
        painter: SketchPainterDivider(
          key: UniqueKey(),
          strokeColor: strokeColor ?? Theme.of(context).colorScheme.outline,
          strokeThickness: strokeThickness ?? 1,
          axis: axis,
        ),
        child: SizedBox(
          width: axis == Axis.horizontal
              ? double.infinity
              : padding?.horizontal ?? 1,
          height:
              axis == Axis.vertical ? double.infinity : padding?.vertical ?? 1,
        ),
      ),
    );
  }
}
