import 'package:bitti/data/models/response/journal_models/journal_entry_model.dart';
import 'package:bitti/data/models/response/journal_models/topic_type_settings_model.dart';
import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_entry_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_entry_model.g.dart';

@JsonSerializable()
class TopicEntryModel extends Model<TopicEntryEntity> {
  final int id;
  final String name;
  final String description;
  final String startDate;
  final String icon;
  final int color;
  final int topicType;
  final TopicTypeSettingsModel topicTypeSettings;
  final List<JournalEntryModel> journals;

  TopicEntryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.icon,
    required this.color,
    required this.topicType,
    required this.topicTypeSettings,
    required this.journals,
  });

  @override
  Map<String, dynamic> toJson() => _$TopicEntryModelToJson(this);

  factory TopicEntryModel.fromJson(Map<String, dynamic> json) =>
      _$TopicEntryModelFromJson(json);
}
