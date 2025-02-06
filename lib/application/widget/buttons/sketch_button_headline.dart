import 'package:bitti/application/widget/sketch_container.dart';
import 'package:flutter/material.dart';

class SketchButtonHeadline extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SketchButtonHeadline({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SketchContainer(
      padding: const EdgeInsets.all(8),
      lineFilledBackground: true,
      embossSize: 6,
      embossColor: Theme.of(context).colorScheme.primary,
      fillColor: Theme.of(context).colorScheme.primaryContainer,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        ),
      ),
    );
  }
}
