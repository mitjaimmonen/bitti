import 'package:bitti/application/models/screen_config_model.dart';
import 'package:bitti/application/screens/topic_editor_screen/topic_editor_screen.dart';
import 'package:bitti/application/screens/topic_editor_screen/view_models/number_settings_dialog_view_model.dart';
import 'package:bitti/application/widget/buttons/sketch_button_headline.dart';
import 'package:bitti/application/widget/inputs/sketch_text_field.dart';
import 'package:bitti/application/widget/sketch_container.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_number_settings_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NumberSettingsDialog extends StatefulWidget {
  final NumberSettingsDialogExtraViewModel extra;

  const NumberSettingsDialog({
    super.key,
    required this.extra,
  });

  static final config = SubRouteConfigModel(
    title: 'Number Settings',
    routePath: '${TopicEditorScreen.config.routePath}/number_settings',
    relativePath: 'number_settings',
  );

  @override
  State<NumberSettingsDialog> createState() => _NumberSettingsDialogState();
}

class _NumberSettingsDialogState extends State<NumberSettingsDialog> {
  late TopicTypeNumberSettingsEntity numberSettings;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _minController = TextEditingController();
  final TextEditingController _maxController = TextEditingController();

  bool isDirty = false;
  bool confirmingCancel = false;

  @override
  void initState() {
    super.initState();
    numberSettings = widget.extra.numberSettings?.copyWith() ??
        TopicTypeNumberSettingsEntity(
          min: 0,
          max: 5,
        );

    _minController.text = numberSettings.min.toString();
    _maxController.text = numberSettings.max.toString();
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
                child: Form(
                  key: _formKey,
                  child: Material(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Number Settings',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                            if (confirmingCancel)
                              TextButton(
                                onPressed: () {
                                  GoRouter.of(context).pop();
                                },
                                child: Text(
                                  'Cancel changes?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color:
                                            Theme.of(context).colorScheme.error,
                                      ),
                                ),
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
                        _buildToggleSettingsContent(),
                        const SizedBox(height: 16),
                        SketchButtonHeadline(
                          text: 'Save',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              GoRouter.of(context).pop(
                                NumberSettingsDialogReturnViewModel(
                                  numberSettings: numberSettings,
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
        SketchTextField(
          controller: _minController,
          keyboardType: TextInputType.number,
          onChanged: (value) {
            numberSettings = numberSettings.copyWith(
              min: int.tryParse(value) ?? 0,
            );

            setState(() {
              isDirty = true;
            });
          },
          labelText: 'Min',
          hintText: 'For example: 0',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a value';
            }
            final intValue = int.tryParse(value);
            if (intValue == null) {
              return 'Please enter a valid number';
            }
            if (intValue > 0) {
              return 'Please enter a negative number or zero';
            }
            if (intValue > numberSettings.max) {
              return 'Min must be less than max';
            }
            return null;
          },
        ),
        SizedBox(height: 16),
        SketchTextField(
          controller: _maxController,
          keyboardType: TextInputType.number,
          onChanged: (value) {
            numberSettings = numberSettings.copyWith(
              max: int.tryParse(value) ?? 0,
            );

            setState(() {
              isDirty = true;
            });
          },
          labelText: 'Max',
          hintText: 'For example: 5',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a value';
            }
            final intValue = int.tryParse(value);
            if (intValue == null) {
              return 'Please enter a valid number';
            }
            if (intValue < 0) {
              return 'Please enter a positive number or zero';
            }
            if (intValue < numberSettings.min) {
              return 'Max must be greater than min';
            }
            return null;
          },
        ),
      ],
    );
  }
}
