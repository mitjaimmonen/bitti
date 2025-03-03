import 'package:bitti/application/widget/sketch_container.dart';
import 'package:flutter/material.dart';

class SketchButtonIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const SketchButtonIcon({
    required this.onPressed,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SketchContainer(
      elevation: 6,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
      ),
    );
  }
}
