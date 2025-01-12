import 'package:bitti/domain/entities/entity.dart';

class TopicSettingValueNoteEntity extends Entity {
  final bool displayInJournal;
  final bool displayInNotes;

  TopicSettingValueNoteEntity({
    required this.displayInJournal,
    required this.displayInNotes,
  });
}
