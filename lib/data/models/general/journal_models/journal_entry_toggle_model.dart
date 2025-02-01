import 'package:bitti/data/models/general/journal_models/journal_entry_model_base.dart';
import 'package:bitti/domain/entities/general/journal_entities/journal_entry_toggle_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/journal_entry_toggle_model.g.dart';

@JsonSerializable()
class JournalEntryToggleModel
    extends JournalEntryModelBase<JournalEntryToggleEntity> {
  final int toggleIndex;

  JournalEntryToggleModel({
    required super.id,
    required super.date,
    required this.toggleIndex,
  });

  @override
  Map<String, dynamic> toJson() => _$JournalEntryToggleModelToJson(this);

  factory JournalEntryToggleModel.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryToggleModelFromJson(json);
}
