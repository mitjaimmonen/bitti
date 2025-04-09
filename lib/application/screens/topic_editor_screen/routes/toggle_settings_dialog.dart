import 'package:bitti/application/models/screen_config_model.dart';
import 'package:bitti/application/screens/topic_editor_screen/entities/toggle_settings_dialog_entities.dart';
import 'package:bitti/application/screens/topic_editor_screen/topic_editor_screen.dart';
import 'package:bitti/application/widget/dialog_widgets/sketch_color_picker_dialog.dart';
import 'package:bitti/application/widget/dialog_widgets/sketch_dialog.dart';
import 'package:bitti/application/widget/sketch_container.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_setting_value_toggle_entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_toggle_settings_entity.dart';
import 'package:bitti/domain/enums/icon_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ToggleSettingsDialog extends StatefulWidget {
  final ToggleSettingsDialogExtraEntity extra;

  const ToggleSettingsDialog({
    super.key,
    required this.extra,
  });

  static final config = SubRouteConfigModel(
    title: 'Toggle Settings',
    routePath: '${TopicEditorScreen.config.routePath}/toggle_settings',
    relativePath: 'toggle_settings',
  );

  @override
  State<ToggleSettingsDialog> createState() => _ToggleSettingsDialogState();
}

class _ToggleSettingsDialogState extends State<ToggleSettingsDialog> {
  late TopicTypeToggleSettingsEntity toggleSettings;

  @override
  void initState() {
    super.initState();
    toggleSettings = widget.extra.toggleSettings ??
        TopicTypeToggleSettingsEntity(
          values: [
            TopicSettingValueToggleEntity(
              iconName: IconName.check.value,
              label: 'Toggle State 1',
              color: Colors.green,
            ),
          ],
        );
  }

  @override
  Widget build(BuildContext context) {
    return SketchContainer(
      width: double.infinity,
      height: double.infinity,
      strokeColor: Colors.transparent,
      fillColor: Theme.of(context).colorScheme.shadow,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text('Toggle Settings',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                          ),
                          IconButton(
                            onPressed: () {
                              GoRouter.of(context).pop(
                                ToggleSettingsDialogReturnEntity(
                                  toggleSettings: toggleSettings,
                                ),
                              );
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      for (var i = 0; i < toggleSettings.values.length; i++)
                        SketchContainer(
                          lineFilledBackground: true,
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    SketchContainer(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      elevation: -4,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          labelText:
                                              toggleSettings.values[i].label,
                                          hintText: 'For example: "Done"',
                                          border: InputBorder.none,
                                        ),
                                        onSubmitted: (value) {
                                          setState(() {
                                            toggleSettings.values[i] =
                                                toggleSettings.values[i]
                                                    .copyWith(label: value);
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Icon'),
                                        SketchContainer(
                                          elevation: 6,
                                          child: IconButton(
                                            onPressed: () async {
                                              // todo route
                                              final newIconName =
                                                  await showDialog<String>(
                                                context: context,
                                                builder: (context) =>
                                                    SketchDialog(
                                                  title: 'Select Icon',
                                                  children: [
                                                    for (var iconName in [
                                                      'default',
                                                      'home',
                                                      'work',
                                                    ])
                                                      ListTile(
                                                        title: Text(iconName),
                                                        onTap: () {
                                                          GoRouter.of(context)
                                                              .pop(iconName);
                                                        },
                                                      ),
                                                  ],
                                                ),
                                              );
                                              if (newIconName != null) {
                                                setState(() {
                                                  toggleSettings.values[i] =
                                                      toggleSettings.values[i]
                                                          .copyWith(
                                                    iconName: newIconName,
                                                  );
                                                });
                                              }
                                            },
                                            icon: Icon(Icons.ac_unit),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Color'),
                                        SketchContainer(
                                          fillColor:
                                              toggleSettings.values[i].color,
                                          elevation: 6,
                                          child: IconButton(
                                            onPressed: () async {
                                              // todo route
                                              final newColor =
                                                  await showDialog<Color>(
                                                context: context,
                                                builder: (context) =>
                                                    SketchColorPickerDialog(
                                                  color: toggleSettings
                                                      .values[i].color,
                                                  onDismiss: () {
                                                    GoRouter.of(context).pop();
                                                  },
                                                  onColorChanged: (newColor) {
                                                    GoRouter.of(context)
                                                        .pop(newColor);
                                                  },
                                                ),
                                              );
                                              if (newColor != null) {
                                                setState(() {
                                                  toggleSettings.values[i] =
                                                      toggleSettings.values[i]
                                                          .copyWith(
                                                    color: newColor,
                                                  );
                                                });
                                              }
                                            },
                                            icon: const SizedBox(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 8),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    toggleSettings.values.removeAt(i);
                                  });
                                },
                                icon: const Icon(Icons.close),
                              ),
                            ],
                          ),
                        ),
                      SizedBox(height: 16),
                      SketchContainer(
                        elevation: 6,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              toggleSettings.values
                                  .add(TopicSettingValueToggleEntity(
                                iconName: IconName.check.value,
                                label:
                                    'Toggle State ${toggleSettings.values.length + 1}',
                                color: widget.extra.color ?? Colors.grey,
                              ));
                            });
                          },
                          icon: const Text('Add Toggle Value'),
                        ),
                      ),
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
}
