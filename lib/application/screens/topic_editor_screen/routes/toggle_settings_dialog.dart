import 'package:bitti/application/models/screen_config_model.dart';
import 'package:bitti/application/screens/topic_editor_screen/routes/color_dialog.dart';
import 'package:bitti/application/screens/topic_editor_screen/topic_editor_screen.dart';
import 'package:bitti/application/screens/topic_editor_screen/view_models/color_dialog_view_model.dart';
import 'package:bitti/application/screens/topic_editor_screen/view_models/toggle_settings_dialog_view_model.dart';
import 'package:bitti/application/widget/buttons/sketch_button_headline.dart';
import 'package:bitti/application/widget/dialog_widgets/sketch_dialog.dart';
import 'package:bitti/application/widget/sketch_container.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_setting_value_toggle_entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_toggle_settings_entity.dart';
import 'package:bitti/domain/enums/icon_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ToggleSettingsDialog extends StatefulWidget {
  final ToggleSettingsDialogExtraViewModel extra;

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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _controllers = [];

  bool isDirty = false;
  bool confirmingCancel = false;

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

    for (var i = 0; i < toggleSettings.values.length; i++) {
      _controllers.add(TextEditingController(
        text: toggleSettings.values[i].label,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
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
              height: double.infinity,
              padding: const EdgeInsets.all(16.0),
              fillColor: Theme.of(context).colorScheme.surface,
              child: SingleChildScrollView(
                child: Material(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildToggleSettingsContent(),
                        SizedBox(height: 16),
                        SketchButtonHeadline(
                          text: 'Save',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              GoRouter.of(context).pop(
                                ToggleSettingsDialogReturnViewModel(
                                  toggleSettings: toggleSettings,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToggleSettingsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text('Toggle Settings',
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            if (confirmingCancel)
              TextButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                child: Text('Cancel changes?',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        )),
              )
            else
              IconButton(
                onPressed: () {
                  if (isDirty) {
                    setState(() {
                      confirmingCancel = true;
                    });
                  } else {
                    GoRouter.of(context).pop();
                  }
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
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        elevation: -4,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: toggleSettings.values[i].label,
                            hintText: 'For example: "Done"',
                            border: InputBorder.none,
                          ),
                          onSubmitted: (value) {
                            setState(() {
                              toggleSettings.values[i] = toggleSettings
                                  .values[i]
                                  .copyWith(label: value);
                              isDirty = true;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Icon'),
                          SketchContainer(
                            elevation: 6,
                            child: IconButton(
                              onPressed: () async {
                                final newIconName = await showDialog<String>(
                                  context: context,
                                  builder: (context) => SketchDialog(
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
                                            GoRouter.of(context).pop(iconName);
                                          },
                                        ),
                                    ],
                                  ),
                                );
                                if (newIconName != null) {
                                  setState(() {
                                    toggleSettings.values[i] =
                                        toggleSettings.values[i].copyWith(
                                      iconName: newIconName,
                                    );
                                    isDirty = true;
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Color'),
                          SketchContainer(
                            fillColor: toggleSettings.values[i].color,
                            elevation: 6,
                            child: IconButton(
                              onPressed: () async {
                                final ColorDialogReturnViewModel? result =
                                    await GoRouter.of(context).push(
                                        ColorDialog.config.routePath,
                                        extra: ColorDialogExtraViewModel(
                                          initialColor:
                                              toggleSettings.values[i].color,
                                        ));
                                if (result != null) {
                                  setState(() {
                                    toggleSettings.values[i] =
                                        toggleSettings.values[i].copyWith(
                                      color: result.color,
                                    );
                                    isDirty = true;
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
                      isDirty = true;
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
                toggleSettings.values.add(TopicSettingValueToggleEntity(
                  iconName: IconName.check.value,
                  label: 'Toggle State ${toggleSettings.values.length + 1}',
                  color: widget.extra.color ?? Colors.grey,
                ));
                isDirty = true;
              });
            },
            icon: const Text('Add Toggle Value'),
          ),
        ),
      ],
    );
  }
}
