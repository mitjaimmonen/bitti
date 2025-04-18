import 'package:bitti/domain/entities/general/topic_entities/topic_type_note_settings_entity.dart';

class NoteSettingsDialogExtraViewModel {
  final TopicTypeNoteSettingsEntity? noteSettings;

  const NoteSettingsDialogExtraViewModel({
    this.noteSettings,
  });
}

class NoteSettingsDialogReturnViewModel {
  final TopicTypeNoteSettingsEntity noteSettings;

  const NoteSettingsDialogReturnViewModel({
    required this.noteSettings,
  });
}
