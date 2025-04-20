import 'package:bitti/application/screens/topic_editor_screen/cubit/topic_editor_cubit.dart';
import 'package:bitti/application/screens/topic_editor_screen/routes/color_dialog.dart';
import 'package:bitti/application/screens/topic_editor_screen/routes/date_dialog.dart';
import 'package:bitti/application/screens/topic_editor_screen/routes/number_settings_dialog.dart';
import 'package:bitti/application/screens/topic_editor_screen/routes/toggle_settings_dialog.dart';
import 'package:bitti/application/screens/topic_editor_screen/view_models/color_dialog_view_model.dart';
import 'package:bitti/application/screens/topic_editor_screen/view_models/date_dialog_view_model.dart';
import 'package:bitti/application/screens/topic_editor_screen/view_models/number_settings_dialog_view_model.dart';
import 'package:bitti/application/screens/topic_editor_screen/view_models/toggle_settings_dialog_view_model.dart';
import 'package:bitti/application/screens/topic_editor_screen/widgets/type_settings_dropdown.dart';
import 'package:bitti/application/widget/dialog_widgets/sketch_dialog.dart';
import 'package:bitti/application/widget/inputs/sketch_text_field.dart';
import 'package:bitti/application/widget/sketch_container.dart';
import 'package:bitti/domain/enums/topic_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class TopicEditorLoadedView extends StatelessWidget {
  final VoidCallback? onDelete;

  const TopicEditorLoadedView({
    super.key,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SketchTextField(
          labelText: 'Name',
          hintText: 'For example: "Cooking at home"',
          padding: EdgeInsets.only(bottom: 16),
          onChanged: (value) =>
              context.read<TopicEditorCubit>().updateTopicEntry(name: value),
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
        BlocBuilder<TopicEditorCubit, TopicEditorState>(
          builder: (context, state) {
            state as TopicEditorLoaded;
            return TypeSettingsDropdown(
              value: state.topicEntry.topicType,
              onChanged: (value) => context
                  .read<TopicEditorCubit>()
                  .updateTopicEntry(topicType: value),
              onOpenSettings: (topicType) async {
                switch (topicType) {
                  case TopicType.note:
                    break;
                  case TopicType.number:
                    _numberSettings(context, state);
                    break;
                  case TopicType.toggle:
                    _toggleSettings(context, state);
                    break;
                  default:
                    break;
                }
              },
              padding: EdgeInsets.only(bottom: 16),
            );
          },
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Start Date'),
            BlocBuilder<TopicEditorCubit, TopicEditorState>(
              builder: (context, state) {
                state as TopicEditorLoaded;
                String locale = Localizations.localeOf(context).languageCode;

                return SketchContainer(
                  elevation: 6,
                  child: TextButton(
                    onPressed: () async {
                      final DateDialogReturnViewModel? output =
                          await GoRouter.of(context)
                              .push(DateDialog.config.routePath,
                                  extra: DateDialogExtraViewModel(
                                    initialDate: state.topicEntry.startDate,
                                  ));
                      if (output?.date != null && context.mounted) {
                        context
                            .read<TopicEditorCubit>()
                            .updateTopicEntry(startDate: output!.date!);
                      }
                    },
                    child: Text(DateFormat.yMd(locale)
                        .format(state.topicEntry.startDate)),
                  ),
                );
              },
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
                        .updateTopicEntry(iconName: newIconName);
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
            BlocBuilder<TopicEditorCubit, TopicEditorState>(
              builder: (context, state) {
                state as TopicEditorLoaded;
                return SketchContainer(
                  fillColor: state.topicEntry.color,
                  elevation: 10,
                  radius: 20,
                  child: IconButton(
                    onPressed: () async {
                      final ColorDialogReturnViewModel? result =
                          await GoRouter.of(context).push(
                        ColorDialog.config.routePath,
                        extra: ColorDialogExtraViewModel(
                          initialColor: state.topicEntry.color,
                        ),
                      );
                      if (result != null && context.mounted) {
                        context
                            .read<TopicEditorCubit>()
                            .updateTopicEntry(color: result.color);
                      }
                    },
                    icon: const SizedBox(),
                  ),
                );
              },
            ),
          ],
        ),
        if (onDelete != null)
          ElevatedButton(
            onPressed: onDelete,
            child: const Text('Delete'),
          ),
      ],
    );
  }

  void _toggleSettings(BuildContext context, TopicEditorLoaded state) async {
    final ToggleSettingsDialogReturnViewModel? result =
        await GoRouter.of(context).push(
      ToggleSettingsDialog.config.routePath,
      extra: ToggleSettingsDialogExtraViewModel(
        toggleSettings: state.topicEntry.topicTypeSettings.toggleSettings,
        color: state.topicEntry.color,
      ),
    );

    if (result != null && context.mounted) {
      final cubit = context.read<TopicEditorCubit>();
      final state = cubit.state as TopicEditorLoaded;
      cubit.updateTopicEntry(
          topicTypeSettings: state.topicEntry.topicTypeSettings.copyWith(
        toggleSettings: result.toggleSettings,
      ));
    }
  }

  void _numberSettings(BuildContext context, TopicEditorLoaded state) async {
    final NumberSettingsDialogReturnViewModel? result =
        await GoRouter.of(context).push(
      NumberSettingsDialog.config.routePath,
      extra: NumberSettingsDialogExtraViewModel(
        numberSettings: state.topicEntry.topicTypeSettings.numberSettings,
      ),
    );

    if (result != null && context.mounted) {
      final cubit = context.read<TopicEditorCubit>();
      final state = cubit.state as TopicEditorLoaded;
      cubit.updateTopicEntry(
          topicTypeSettings: state.topicEntry.topicTypeSettings.copyWith(
        numberSettings: result.numberSettings,
      ));
    }
  }
}
