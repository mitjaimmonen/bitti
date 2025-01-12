import 'package:bitti/domain/entities/entity.dart';

class NoteSettingValueEntity extends Entity {
  final bool displayInJournal;
  final bool displayInNotes;

  NoteSettingValueEntity({
    required this.displayInJournal,
    required this.displayInNotes,
  });
}
