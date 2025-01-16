import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/response/journal_entities/journal_entry_entity_base.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/journal_entry_model.g.dart';

@JsonSerializable()
abstract class JournalEntryModel<T extends JournalEntryEntityBase>
    extends Model<T> {
  final int id;
  final String date;

  JournalEntryModel({
    required this.id,
    required this.date,
  });

  @override
  Map<String, dynamic> toJson() => _$JournalEntryModelToJson(this);

  factory JournalEntryModel.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryModelFromJson(json);
}
