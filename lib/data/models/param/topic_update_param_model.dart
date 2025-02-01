import 'package:bitti/data/models/general/topic_models/topic_entry_model.dart';
import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/param/topic_update_param_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_update_param_model.g.dart';

@JsonSerializable(createFactory: false)
class TopicUpdateParamModel extends ParamModel<TopicUpdateParamEntity> {
  final TopicEntryModel topic;

  const TopicUpdateParamModel({
    required this.topic,
  });

  @override
  Map<String, dynamic> toJson() => _$TopicUpdateParamModelToJson(this);
}
