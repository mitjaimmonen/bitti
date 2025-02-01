import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/general/journal_entities/journal_entry_entity_base.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/journal_entry_model_base.g.dart';

@JsonSerializable()
abstract class JournalEntryModelBase<T extends JournalEntryEntityBase>
    extends Model<T> {
  final int id;
  final String date;

  JournalEntryModelBase({
    required this.id,
    required this.date,
  });

  Map<String, dynamic> toJson() => _$JournalEntryModelBaseToJson(this);

  factory JournalEntryModelBase.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryModelBaseFromJson(json);
}
