import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/general/journal_entities/journal_entry_number_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/journal_entry_number_model.g.dart';

@JsonSerializable()
class JournalEntryNumberModel extends Model<JournalEntryNumberEntity> {
  final int number;

  JournalEntryNumberModel({
    required this.number,
  });

  Map<String, dynamic> toJson() => _$JournalEntryNumberModelToJson(this);

  factory JournalEntryNumberModel.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryNumberModelFromJson(json);

  JournalEntryNumberEntity toEntity() {
    return JournalEntryNumberEntity(
      number: number,
    );
  }

  factory JournalEntryNumberModel.fromEntity(JournalEntryNumberEntity entity) {
    return JournalEntryNumberModel(
      number: entity.number,
    );
  }
}
