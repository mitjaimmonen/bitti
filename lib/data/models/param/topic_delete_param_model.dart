import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/param/topic_delete_param_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_delete_param_model.g.dart';

@JsonSerializable(createFactory: false)
class TopicDeleteParamModel extends ParamModel<TopicDeleteParamEntity> {
  final int id;

  const TopicDeleteParamModel({
    required this.id,
  });

  @override
  Map<String, dynamic> toJson() => _$TopicDeleteParamModelToJson(this);
}
