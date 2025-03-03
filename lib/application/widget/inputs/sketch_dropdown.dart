import 'package:bitti/application/widget/sketch_container.dart';
import 'package:flutter/material.dart';

class SketchDropdown<T> extends StatelessWidget {
  final String? title;
  final String? hintText;
  final EdgeInsets? padding;
  final T value;
  final List<DropdownMenuItem<T>> items;
  final Function(T?) onChanged;

  const SketchDropdown({
    this.title,
    this.hintText,
    this.padding,
    required this.value,
    required this.items,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (title != null)
            Column(
              children: [
                Text(title!),
                if (hintText != null) Text(hintText!),
              ],
            ),
          SketchContainer(
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: DropdownButton<T>(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                value: value,
                onChanged: onChanged,
                items: items,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
