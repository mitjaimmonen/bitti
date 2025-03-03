import 'package:bitti/application/models/screen_config_model.dart';
import 'package:bitti/application/screens/topic_editor_screen/cubit/topic_editor_cubit.dart';
import 'package:bitti/application/screens/topic_editor_screen/entities/date_dialog_extra_entity.dart';
import 'package:bitti/application/screens/topic_editor_screen/entities/topic_editor_extra_entity.dart';
import 'package:bitti/application/screens/topic_editor_screen/routes/date_dialog.dart';
import 'package:bitti/application/screens/topic_editor_screen/widgets/type_settings_dropdown.dart';
import 'package:bitti/application/widget/dialog_widgets/sketch_color_picker_dialog.dart';
import 'package:bitti/application/widget/dialog_widgets/sketch_dialog.dart';
import 'package:bitti/application/widget/inputs/sketch_text_field.dart';
import 'package:bitti/application/widget/sketch_container.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_entry_entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_setting_value_toggle_entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_settings_entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_toggle_settings_entity.dart';
import 'package:bitti/domain/enums/icon_name.dart';
import 'package:bitti/domain/enums/topic_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class TopicEditorScreen extends StatefulWidget {
  final TopicEditorExtraEntity extra;

  static const config = ScreenConfigModel(
    title: 'Topic Editor',
    routePath: '/topic-editor',
  );

  const TopicEditorScreen({
    super.key,
    required this.extra,
  });

  @override
  TopicEditorScreenState createState() => TopicEditorScreenState();
}

class TopicEditorScreenState extends State<TopicEditorScreen> {
  final _formKey = GlobalKey<FormState>();
  late int id;
  late String name;
  late String description;
  late DateTime startDate;
  late String iconName;
  late Color color;
  late TopicType topicType;
  late TopicTypeSettingsEntity topicTypeSettings;

  @override
  void initState() {
    super.initState();
    final topicEntry = widget.extra.topicEntry;
    id = topicEntry?.id ?? DateTime.now().millisecondsSinceEpoch;
    name = topicEntry?.name ?? '';
    description = topicEntry?.description ?? '';
    startDate = topicEntry?.startDate ?? DateTime.now();
    iconName = topicEntry?.iconName ?? 'default';
    color = topicEntry?.color ?? Colors.blue;
    topicType = topicEntry?.topicType ?? TopicType.toggle;
    topicTypeSettings = topicEntry?.topicTypeSettings ??
        TopicTypeSettingsEntity(
          noteSettings: null,
          numberSettings: null,
          toggleSettings: TopicTypeToggleSettingsEntity(values: []),
        );
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final topicEntry = TopicEntryEntity(
        id: id,
        name: name,
        description: description,
        startDate: startDate,
        iconName: iconName,
        color: color,
        topicType: topicType,
        topicTypeSettings: topicTypeSettings,
      );
      context.pop(TopicEditorReturnData(topicEntry: topicEntry));
    }
  }

  void _delete() {
    context.pop(const TopicEditorReturnData(delete: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topic Editor'),
        actions: [
          TextButton(
            onPressed: _save,
            child: const Text('Save'),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => TopicEditorCubit(),
        child: BlocBuilder<TopicEditorCubit, TopicEditorState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SketchTextField(
                        labelText: 'Name',
                        hintText: 'For example: "Cooking at home"',
                        padding: EdgeInsets.only(bottom: 16),
                        onSubmitted: (value) => context
                            .read<TopicEditorCubit>()
                            .updateTopicEntry(name: value),
                      ),
                      SketchTextField(
                        minLines: 1,
                        maxLines: 4,
                        labelText: 'Description',
                        hintText: 'For example: What do you track and why?',
                        padding: EdgeInsets.only(bottom: 16),
                        onSubmitted: (value) => context
                            .read<TopicEditorCubit>()
                            .updateTopicEntry(description: value),
                      ),
                      TypeSettingsDropdown(
                        value: topicType,
                        onChanged: (value) => topicType = value!,
                        onOpenSettings: (topicType) {
                          switch (topicType) {
                            case TopicType.note:
                              break;
                            case TopicType.number:
                              break;
                            case TopicType.toggle:
                              break;
                            default:
                              break;
                          }
                        },
                        padding: EdgeInsets.only(bottom: 16),
                      ),
                      Row(
                        children: [
                          Expanded(child: _topicSettings(context)),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Start Date'),
                          SketchContainer(
                            elevation: 6,
                            child: TextButton(
                              onPressed: () async {
                                final DateDialogReturnEntity? output =
                                    await context.push(
                                        DateDialog.config.routePath,
                                        extra: DateDialogExtraEntity(
                                          initialDate: startDate,
                                        ));
                                if (output?.date != null && context.mounted) {
                                  context
                                      .read<TopicEditorCubit>()
                                      .updateTopicEntry(
                                          startDate: output!.date!);
                                }
                              },
                              child: Builder(builder: (context) {
                                String locale = Localizations.localeOf(context)
                                    .languageCode;
                                return Text(
                                    DateFormat.yMd(locale).format(startDate));
                              }),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
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
                                            Navigator.pop(context, iconName);
                                          },
                                        ),
                                    ],
                                  ),
                                );
                                if (newIconName != null) {
                                  setState(() {
                                    iconName = newIconName;
                                  });
                                }
                              },
                              icon: Icon(Icons.ac_unit),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Color'),
                          SketchContainer(
                            fillColor: color,
                            elevation: 6,
                            child: IconButton(
                              onPressed: () async {
                                final newColor = await showDialog<Color>(
                                  context: context,
                                  builder: (context) => SketchColorPickerDialog(
                                    color: color,
                                    onDismiss: () {
                                      Navigator.pop(context);
                                    },
                                    onColorChanged: (newColor) {
                                      Navigator.pop(context, newColor);
                                    },
                                  ),
                                );
                                if (newColor != null) {
                                  setState(() {
                                    color = newColor;
                                  });
                                }
                              },
                              icon: const SizedBox(),
                            ),
                          ),
                        ],
                      ),
                      if (widget.extra.topicEntry != null)
                        ElevatedButton(
                          onPressed: _delete,
                          child: const Text('Delete'),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _topicSettings(BuildContext context) {
    if (topicType == TopicType.toggle) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Toggle Settings',
              style: Theme.of(context).textTheme.labelMedium),
          SizedBox(height: 16),
          for (var i = 0;
              i < topicTypeSettings.toggleSettings!.values.length;
              i++)
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
                              labelText: topicTypeSettings
                                  .toggleSettings!.values[i].label,
                              hintText: 'For example: "Done"',
                              border: InputBorder.none,
                            ),
                            onSubmitted: (value) {
                              setState(() {
                                topicTypeSettings.toggleSettings!.values[i] =
                                    topicTypeSettings.toggleSettings!.values[i]
                                        .copyWith(label: value);
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
                                              Navigator.pop(context, iconName);
                                            },
                                          ),
                                      ],
                                    ),
                                  );
                                  if (newIconName != null) {
                                    setState(() {
                                      topicTypeSettings
                                              .toggleSettings!.values[i] =
                                          topicTypeSettings
                                              .toggleSettings!.values[i]
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Color'),
                            SketchContainer(
                              fillColor: topicTypeSettings
                                  .toggleSettings!.values[i].color,
                              elevation: 6,
                              child: IconButton(
                                onPressed: () async {
                                  final newColor = await showDialog<Color>(
                                    context: context,
                                    builder: (context) =>
                                        SketchColorPickerDialog(
                                      color: topicTypeSettings
                                          .toggleSettings!.values[i].color,
                                      onDismiss: () {
                                        Navigator.pop(context);
                                      },
                                      onColorChanged: (newColor) {
                                        Navigator.pop(context, newColor);
                                      },
                                    ),
                                  );
                                  if (newColor != null) {
                                    setState(() {
                                      topicTypeSettings
                                              .toggleSettings!.values[i] =
                                          topicTypeSettings
                                              .toggleSettings!.values[i]
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
                        topicTypeSettings.toggleSettings!.values.removeAt(i);
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
                  topicTypeSettings.toggleSettings!.values
                      .add(TopicSettingValueToggleEntity(
                    iconName: IconName.check.value,
                    label:
                        'Toggle State ${topicTypeSettings.toggleSettings!.values.length + 1}',
                    color: color,
                  ));
                });
              },
              icon: const Text('Add Toggle Value'),
            ),
          ),
        ],
      );
    }

    return SizedBox();
  }
}
