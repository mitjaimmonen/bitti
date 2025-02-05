import 'dart:ui';

import 'package:bitti/data/models/general/topic_models/topic_type_settings_model.dart';
import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_entry_entity.dart';
import 'package:bitti/domain/enums/topic_type.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_entry_model.g.dart';

@JsonSerializable()
class TopicEntryModel extends Model<TopicEntryEntity> {
  final int id;
  final String name;
  final String description;
  final String startDate;
  final String iconName;
  final int color;
  final int topicType;
  final TopicTypeSettingsModel topicTypeSettings;

  const TopicEntryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.iconName,
    required this.color,
    required this.topicType,
    required this.topicTypeSettings,
  });

  Map<String, dynamic> toJson() => _$TopicEntryModelToJson(this);

  factory TopicEntryModel.fromJson(Map<String, dynamic> json) =>
      _$TopicEntryModelFromJson(json);

  TopicEntryEntity toEntity() {
    return TopicEntryEntity(
      id: id,
      name: name,
      description: description,
      startDate: DateTime.parse(startDate),
      iconName: iconName,
      color: Color(color),
      topicType: TopicType.fromValue(topicType),
      topicTypeSettings: topicTypeSettings.toEntity(),
    );
  }

  factory TopicEntryModel.fromEntity(TopicEntryEntity entity) {
    return TopicEntryModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      startDate: entity.startDate.toIso8601String(),
      iconName: entity.iconName,
      color: entity.color.toARGB32(),
      topicType: entity.topicType.value,
      topicTypeSettings:
          TopicTypeSettingsModel.fromEntity(entity.topicTypeSettings),
    );
  }
}
