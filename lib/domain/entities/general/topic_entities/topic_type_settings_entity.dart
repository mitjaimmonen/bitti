import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_note_settings_entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_number_settings_entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_toggle_settings_entity.dart';

class TopicTypeSettingsEntity extends Entity {
  final TopicTypeNoteSettingsEntity? noteSettings;
  final TopicTypeNumberSettingsEntity? numberSettings;
  final TopicTypeToggleSettingsEntity? toggleSettings;

  const TopicTypeSettingsEntity({
    required this.noteSettings,
    required this.numberSettings,
    required this.toggleSettings,
  }) : assert(noteSettings != null ||
            numberSettings != null ||
            toggleSettings != null);
}
