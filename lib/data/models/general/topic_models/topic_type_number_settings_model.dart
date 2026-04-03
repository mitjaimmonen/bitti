import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_number_settings_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_type_number_settings_model.g.dart';

@JsonSerializable()
class TopicTypeNumberSettingsModel
    extends Model<TopicTypeNumberSettingsEntity> {
  final int min;
  final int max;

  const TopicTypeNumberSettingsModel({
    required this.min,
    required this.max,
  });

  Map<String, dynamic> toJson() => _$TopicTypeNumberSettingsModelToJson(this);

  factory TopicTypeNumberSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$TopicTypeNumberSettingsModelFromJson(json);

  TopicTypeNumberSettingsEntity toEntity() {
    return TopicTypeNumberSettingsEntity(
      min: min,
      max: max,
    );
  }

  factory TopicTypeNumberSettingsModel.fromEntity(
    TopicTypeNumberSettingsEntity entity,
  ) {
    return TopicTypeNumberSettingsModel(
      min: entity.min,
      max: entity.max,
    );
  }
}
