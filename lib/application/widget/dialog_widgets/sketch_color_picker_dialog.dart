import 'package:bitti/application/configuration/theme.dart';
import 'package:bitti/application/widget/dialog_widgets/sketch_dialog.dart';
import 'package:bitti/application/widget/sketch_container.dart';
import 'package:flutter/material.dart';

class SketchColorPickerDialog extends StatelessWidget {
  final Color color;
  final VoidCallback onDismiss;
  final Function(Color) onColorChanged;

  const SketchColorPickerDialog({
    super.key,
    required this.color,
    required this.onDismiss,
    required this.onColorChanged,
  });

  @override
  Widget build(BuildContext context) {
    final extension = Theme.of(context).extension<SketchColorExtension>()!;
    return SketchDialog(
      title: 'Select Color',
      onDismiss: onDismiss,
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                colorButton(extension.blue, onColorChanged),
                colorButton(extension.green, onColorChanged),
                colorButton(extension.red, onColorChanged),
                colorButton(extension.yellow, onColorChanged),
                colorButton(extension.purple, onColorChanged),
                colorButton(extension.orange, onColorChanged),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                colorButton(extension.blueAccent, onColorChanged),
                colorButton(extension.greenAccent, onColorChanged),
                colorButton(extension.redAccent, onColorChanged),
                colorButton(extension.yellowAccent, onColorChanged),
                colorButton(extension.purpleAccent, onColorChanged),
                colorButton(extension.orangeAccent, onColorChanged),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget colorButton(Color color, Function(Color p1) onColorChanged) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      onPressed: () => onColorChanged(color),
      icon: SketchContainer(
        fillColor: color,
        child: const SizedBox(width: 32, height: 32),
      ),
    );
  }
}
