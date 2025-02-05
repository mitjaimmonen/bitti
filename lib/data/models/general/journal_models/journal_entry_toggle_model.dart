import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/general/journal_entities/journal_entry_toggle_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/journal_entry_toggle_model.g.dart';

@JsonSerializable()
class JournalEntryToggleModel extends Model<JournalEntryToggleEntity> {
  final int toggleIndex;

  const JournalEntryToggleModel({
    required this.toggleIndex,
  });

  Map<String, dynamic> toJson() => _$JournalEntryToggleModelToJson(this);

  factory JournalEntryToggleModel.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryToggleModelFromJson(json);

  JournalEntryToggleEntity toEntity() {
    return JournalEntryToggleEntity(
      toggleIndex: toggleIndex,
    );
  }

  factory JournalEntryToggleModel.fromEntity(JournalEntryToggleEntity entity) {
    return JournalEntryToggleModel(
      toggleIndex: entity.toggleIndex,
    );
  }
}
