import 'package:bitti/application/widget/sketch_container.dart';
import 'package:flutter/material.dart';

class SketchDialog extends StatelessWidget {
  final String title;
  final VoidCallback? onDismiss;
  final List<Widget> children;

  const SketchDialog({
    super.key,
    required this.title,
    required this.children,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: ContinuousRectangleBorder(),
      child: SketchContainer(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                children: children,
              ),
              if (onDismiss != null)
                TextButton(
                  onPressed: onDismiss,
                  child: const Text('Cancel'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
