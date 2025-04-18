import 'package:bitti/application/models/screen_config_model.dart';
import 'package:bitti/application/screens/topic_editor_screen/topic_editor_screen.dart';
import 'package:bitti/application/screens/topic_editor_screen/view_models/note_settings_dialog_view_model.dart';
import 'package:bitti/application/widget/buttons/sketch_button_headline.dart';
import 'package:bitti/application/widget/sketch_container.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_note_settings_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoteSettingsDialog extends StatefulWidget {
  final NoteSettingsDialogExtraViewModel extra;

  const NoteSettingsDialog({
    super.key,
    required this.extra,
  });

  static final config = SubRouteConfigModel(
    title: 'Note Settings',
    routePath: '${TopicEditorScreen.config.routePath}/note_settings',
    relativePath: 'note_settings',
  );

  @override
  State<NoteSettingsDialog> createState() => _NoteSettingsDialogState();
}

class _NoteSettingsDialogState extends State<NoteSettingsDialog> {
  late TopicTypeNoteSettingsEntity noteSettings;

  bool isDirty = false;
  bool confirmingCancel = false;

  @override
  void initState() {
    super.initState();
    noteSettings = widget.extra.noteSettings?.copyWith() ??
        TopicTypeNoteSettingsEntity(
          displayInJournal: true,
          displayInNotes: true,
        );
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
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text('Number Settings',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                          ),
                          if (confirmingCancel)
                            TextButton(
                              onPressed: () {
                                GoRouter.of(context).pop();
                              },
                              child: Text('Cancel changes?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color:
                                            Theme.of(context).colorScheme.error,
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
                      _buildToggleSettingsContent(),
                      const SizedBox(height: 16),
                      SketchButtonHeadline(
                        text: 'Save',
                        onPressed: () {
                          GoRouter.of(context).pop(
                            NoteSettingsDialogReturnViewModel(
                              noteSettings: noteSettings,
                            ),
                          );
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
    );
  }

  Widget _buildToggleSettingsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [],
    );
  }
}
