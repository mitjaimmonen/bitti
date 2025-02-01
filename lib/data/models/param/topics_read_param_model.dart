import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/param/topics_read_param_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topics_read_param_model.g.dart';

@JsonSerializable(createFactory: false)
class TopicsReadParamModel extends ParamModel<TopicsReadParamEntity> {
  const TopicsReadParamModel();

  @override
  Map<String, dynamic> toJson() => _$TopicsReadParamModelToJson(this);
}
