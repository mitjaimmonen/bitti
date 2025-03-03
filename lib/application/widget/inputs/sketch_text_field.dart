import 'package:bitti/application/widget/sketch_container.dart';
import 'package:flutter/material.dart';

class SketchTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final int? maxLines;
  final int? minLines;
  final EdgeInsets? padding;
  final Function(String)? onSubmitted;

  const SketchTextField({
    required this.labelText,
    required this.hintText,
    this.maxLines,
    this.minLines,
    this.padding,
    required this.onSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SketchContainer(
        elevation: -4,
        lineFilledBackground: true,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          maxLines: maxLines,
          minLines: minLines,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            border: InputBorder.none,
          ),
          onSubmitted: onSubmitted,
        ),
      ),
    );
  }
}
