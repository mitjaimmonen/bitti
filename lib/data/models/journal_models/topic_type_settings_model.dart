import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/journal_entities/topic_type_settings_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_type_settings_model.g.dart';

@JsonSerializable()
abstract class TopicTypeSettingsModel<T extends TopicTypeSettingsEntity>
    extends Model<T> {
  TopicTypeSettingsModel();

  @override
  Map<String, dynamic> toJson() => _$TopicTypeSettingsModelToJson(this);

  factory TopicTypeSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$TopicTypeSettingsModelFromJson(json);
}
