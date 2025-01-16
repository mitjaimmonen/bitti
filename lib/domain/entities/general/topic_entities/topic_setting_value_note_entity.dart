import 'package:bitti/domain/entities/entity.dart';

class TopicSettingValueNoteEntity extends Entity {
  final bool displayInJournal;
  final bool displayInNotes;

  const TopicSettingValueNoteEntity({
    required this.displayInJournal,
    required this.displayInNotes,
  });
}
