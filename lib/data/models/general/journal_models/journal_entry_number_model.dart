import 'package:bitti/data/models/general/journal_models/journal_entry_model_base.dart';
import 'package:bitti/domain/entities/general/journal_entities/journal_entry_number_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/journal_entry_number_model.g.dart';

@JsonSerializable()
class JournalEntryNumberModel
    extends JournalEntryModelBase<JournalEntryNumberEntity> {
  final int number;

  JournalEntryNumberModel({
    required super.id,
    required super.date,
    required this.number,
  });

  @override
  Map<String, dynamic> toJson() => _$JournalEntryNumberModelToJson(this);

  factory JournalEntryNumberModel.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryNumberModelFromJson(json);
}
