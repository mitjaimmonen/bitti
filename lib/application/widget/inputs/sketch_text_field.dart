import 'package:bitti/application/widget/sketch_container.dart';
import 'package:flutter/material.dart';

class SketchTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final int? maxLines;
  final int? minLines;
  final EdgeInsets? padding;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const SketchTextField({
    required this.labelText,
    required this.hintText,
    this.maxLines,
    this.minLines,
    this.padding,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    this.controller,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SketchContainer(
        elevation: -20,
        radius: 40,
        lineFilledBackground: true,
        fillColor: Theme.of(context).colorScheme.surfaceContainer,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          minLines: minLines,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            border: InputBorder.none,
          ),
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          validator: validator,
        ),
      ),
    );
  }
}
