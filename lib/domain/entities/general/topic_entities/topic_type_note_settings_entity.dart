import 'package:bitti/domain/entities/entity.dart';

class TopicTypeNoteSettingsEntity extends Entity {
  final bool displayInJournal;
  final bool displayInNotes;

  const TopicTypeNoteSettingsEntity({
    required this.displayInJournal,
    required this.displayInNotes,
  });
}
