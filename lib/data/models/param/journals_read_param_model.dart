import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/param/journals_read_param_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/journals_read_param_model.g.dart';

@JsonSerializable(createFactory: false)
class JournalsReadParamModel extends ParamModel<JournalsReadParamEntity> {
  final int topicId;
  final DateTime? startDate;
  final DateTime? endDate;

  const JournalsReadParamModel({
    required this.topicId,
    this.startDate,
    this.endDate,
  });

  @override
  Map<String, dynamic> toJson() => _$JournalsReadParamModelToJson(this);
}
