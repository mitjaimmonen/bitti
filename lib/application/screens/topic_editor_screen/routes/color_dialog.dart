import 'package:bitti/application/configuration/theme.dart';
import 'package:bitti/application/models/screen_config_model.dart';
import 'package:bitti/application/screens/topic_editor_screen/topic_editor_screen.dart';
import 'package:bitti/application/screens/topic_editor_screen/view_models/color_dialog_view_model.dart';
import 'package:bitti/application/widget/sketch_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ColorDialog extends StatelessWidget {
  final ColorDialogExtraViewModel? extra;

  const ColorDialog({
    super.key,
    this.extra,
  });

  static final config = SubRouteConfigModel(
    title: 'Color Dialog',
    routePath: '${TopicEditorScreen.config.routePath}/color_dialog',
    relativePath: '/color_dialog',
  );

  void _onColorChanged(BuildContext context, Color color) {
    GoRouter.of(context).pop(ColorDialogReturnViewModel(
      color: color,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final extension = Theme.of(context).extension<SketchColorExtension>()!;
    return SketchContainer(
      width: double.infinity,
      height: double.infinity,
      strokeColor: Colors.transparent,
      fillColor: Theme.of(context).colorScheme.secondaryContainer,
      lineFilledBackground: true,
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SketchContainer(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Material(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          colorButton(extension.blue,
                              (color) => _onColorChanged(context, color)),
                          colorButton(extension.green,
                              (color) => _onColorChanged(context, color)),
                          colorButton(extension.red,
                              (color) => _onColorChanged(context, color)),
                          colorButton(extension.yellow,
                              (color) => _onColorChanged(context, color)),
                          colorButton(extension.purple,
                              (color) => _onColorChanged(context, color)),
                          colorButton(extension.orange,
                              (color) => _onColorChanged(context, color)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          colorButton(extension.blueAccent,
                              (color) => _onColorChanged(context, color)),
                          colorButton(extension.greenAccent,
                              (color) => _onColorChanged(context, color)),
                          colorButton(extension.redAccent,
                              (color) => _onColorChanged(context, color)),
                          colorButton(extension.yellowAccent,
                              (color) => _onColorChanged(context, color)),
                          colorButton(extension.purpleAccent,
                              (color) => _onColorChanged(context, color)),
                          colorButton(extension.orangeAccent,
                              (color) => _onColorChanged(context, color)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
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
