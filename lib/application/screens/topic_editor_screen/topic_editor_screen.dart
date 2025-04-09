import 'package:bitti/application/models/screen_config_model.dart';
import 'package:bitti/application/screens/topic_editor_screen/cubit/topic_editor_cubit.dart';
import 'package:bitti/application/screens/topic_editor_screen/entities/date_dialog_entities.dart';
import 'package:bitti/application/screens/topic_editor_screen/entities/toggle_settings_dialog_entities.dart';
import 'package:bitti/application/screens/topic_editor_screen/entities/topic_editor_extra_entity.dart';
import 'package:bitti/application/screens/topic_editor_screen/routes/date_dialog.dart';
import 'package:bitti/application/screens/topic_editor_screen/routes/toggle_settings_dialog.dart';
import 'package:bitti/application/screens/topic_editor_screen/widgets/type_settings_dropdown.dart';
import 'package:bitti/application/widget/dialog_widgets/sketch_color_picker_dialog.dart';
import 'package:bitti/application/widget/dialog_widgets/sketch_dialog.dart';
import 'package:bitti/application/widget/inputs/sketch_text_field.dart';
import 'package:bitti/application/widget/sketch_container.dart';
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

  void _save(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final cubit = context.read<TopicEditorCubit>();
      final state = cubit.state as TopicEditorLoaded;
      context.pop(TopicEditorReturnData(topicEntry: state.topicEntry));
    }
  }

  void _delete() {
    context.pop(const TopicEditorReturnData(delete: true));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TopicEditorCubit()
          ..init(
            widget.extra.topicEntry,
          ),
        child: BlocBuilder<TopicEditorCubit, TopicEditorState>(
          builder: (context, state) {
            if (state is! TopicEditorLoaded) {
              return const Center(child: CircularProgressIndicator());
            }
            return Scaffold(
              appBar: AppBar(
                title: const Text('Topic Editor'),
                actions: [
                  TextButton(
                    onPressed: () => _save(context),
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
                        SketchTextField(
                          labelText: 'Name',
                          hintText: 'For example: "Cooking at home"',
                          padding: EdgeInsets.only(bottom: 16),
                          onChanged: (value) => context
                              .read<TopicEditorCubit>()
                              .updateTopicEntry(name: value),
                        ),
                        SketchTextField(
                          minLines: 1,
                          maxLines: 4,
                          labelText: 'Description',
                          hintText: 'For example: What do you track and why?',
                          padding: EdgeInsets.only(bottom: 16),
                          onChanged: (value) => context
                              .read<TopicEditorCubit>()
                              .updateTopicEntry(description: value),
                        ),
                        TypeSettingsDropdown(
                          value: state.topicEntry.topicType,
                          onChanged: (value) => context
                              .read<TopicEditorCubit>()
                              .updateTopicEntry(topicType: value),
                          onOpenSettings: (topicType) async {
                            switch (topicType) {
                              case TopicType.note:
                                break;
                              case TopicType.number:
                                break;
                              case TopicType.toggle:
                                final ToggleSettingsDialogReturnEntity? result =
                                    await GoRouter.of(context).push(
                                  ToggleSettingsDialog.config.routePath,
                                  extra: ToggleSettingsDialogExtraEntity(
                                    toggleSettings: state.topicEntry
                                        .topicTypeSettings.toggleSettings,
                                    color: state.topicEntry.color,
                                  ),
                                );

                                if (result != null && context.mounted) {
                                  final cubit =
                                      context.read<TopicEditorCubit>();
                                  final state =
                                      cubit.state as TopicEditorLoaded;
                                  cubit.updateTopicEntry(
                                      topicTypeSettings: state
                                          .topicEntry.topicTypeSettings
                                          .copyWith(
                                    toggleSettings: result.toggleSettings,
                                  ));
                                }
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
                                      await GoRouter.of(context)
                                          .push(DateDialog.config.routePath,
                                              extra: DateDialogExtraEntity(
                                                initialDate:
                                                    state.topicEntry.startDate,
                                              ));
                                  if (output?.date != null && context.mounted) {
                                    context
                                        .read<TopicEditorCubit>()
                                        .updateTopicEntry(
                                            startDate: output!.date!);
                                  }
                                },
                                child: Builder(builder: (context) {
                                  String locale =
                                      Localizations.localeOf(context)
                                          .languageCode;
                                  return Text(DateFormat.yMd(locale)
                                      .format(state.topicEntry.startDate));
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
                                  if (newIconName != null && context.mounted) {
                                    context
                                        .read<TopicEditorCubit>()
                                        .updateTopicEntry(
                                            iconName: newIconName);
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
                              fillColor: state.topicEntry.color,
                              elevation: 6,
                              child: IconButton(
                                onPressed: () async {
                                  final newColor = await showDialog<Color>(
                                    context: context,
                                    builder: (context) =>
                                        SketchColorPickerDialog(
                                      color: state.topicEntry.color,
                                      onDismiss: () {
                                        Navigator.pop(context);
                                      },
                                      onColorChanged: (newColor) {
                                        Navigator.pop(context, newColor);
                                      },
                                    ),
                                  );
                                  if (newColor != null && context.mounted) {
                                    context
                                        .read<TopicEditorCubit>()
                                        .updateTopicEntry(color: newColor);
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
          },
        ));
  }

  Widget _topicSettings(BuildContext context) {
    return SizedBox();
  }
}
