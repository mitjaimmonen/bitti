import 'package:bitti/application/models/screen_config_model.dart';
import 'package:bitti/application/widget/dialog_widgets/sketch_color_picker_dialog.dart';
import 'package:bitti/application/widget/dialog_widgets/sketch_dialog.dart';
import 'package:bitti/application/widget/sketch_container.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_entry_entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_setting_value_toggle_entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_settings_entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_toggle_settings_entity.dart';
import 'package:bitti/domain/enums/icon_name.dart';
import 'package:bitti/domain/enums/topic_type.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class TopicEditorExtraData {
  final TopicEntryEntity? topicEntry;

  const TopicEditorExtraData({
    this.topicEntry,
  });
}

class TopicEditorReturnData {
  final TopicEntryEntity? topicEntry;
  final bool delete;

  const TopicEditorReturnData({
    this.topicEntry,
    this.delete = false,
  });
}

class TopicEditorScreen extends StatefulWidget {
  final TopicEditorExtraData extra;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SketchContainer(
                  elevation: -4,
                  lineFilledBackground: true,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: 'For example: "Cooking at home"',
                      border: InputBorder.none,
                    ),
                    onSubmitted: (value) => name = value,
                  ),
                ),
                SizedBox(height: 16),
                SketchContainer(
                  elevation: -4,
                  lineFilledBackground: true,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    minLines: 1,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      hintText: 'For example: What do you track and why?',
                      border: InputBorder.none,
                    ),
                    onSubmitted: (value) => description = value,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Type'),
                    SketchContainer(
                      elevation: 6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: DropdownButton<TopicType>(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          value: topicType,
                          onChanged: (value) {
                            setState(() {
                              topicType = value!;
                            });
                          },
                          items: [
                            DropdownMenuItem(
                              value: TopicType.toggle,
                              child: Text('Toggle'),
                            ),
                            DropdownMenuItem(
                              value: TopicType.number,
                              child: Text('Number'),
                            ),
                            DropdownMenuItem(
                              value: TopicType.note,
                              child: Text('Note'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
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
                          final date = await showDialog(
                            context: context,
                            builder: (context) {
                              DateTime output = startDate;
                              return SketchDialog(
                                title: 'Select Date',
                                children: [
                                  Material(
                                    child: DatePickerTheme(
                                      data: DatePickerThemeData(),
                                      child: CalendarDatePicker(
                                        initialDate: startDate,
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime.now()
                                            .add(const Duration(seconds: 1)),
                                        onDateChanged: (date) {
                                          output = date;
                                        },
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, output);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                          if (date != null) {
                            setState(() {
                              startDate = date;
                            });
                          }
                        },
                        child: Builder(builder: (context) {
                          String locale =
                              Localizations.localeOf(context).languageCode;
                          return Text(DateFormat.yMd(locale).format(startDate));
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
            Row(
              children: [
                Expanded(
                  child: SketchContainer(
                      lineFilledBackground: true,
                      padding: const EdgeInsets.all(8),
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
                                      topicTypeSettings
                                          .toggleSettings!.values[i]
                                          .copyWith(label: value);
                                });
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Icon'),
                              SketchContainer(
                                elevation: 6,
                                child: IconButton(
                                  onPressed: () async {
                                    final newIconName =
                                        await showDialog<String>(
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
                                                Navigator.pop(
                                                    context, iconName);
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
                      )),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      topicTypeSettings.toggleSettings!.values.removeAt(i);
                    });
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
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
