import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/param/journal_delete_param_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/journal_delete_param_model.g.dart';

@JsonSerializable(createFactory: false)
class JournalDeleteParamModel extends ParamModel<JournalDeleteParamEntity> {
  final int topicId;
  final int journalId;

  const JournalDeleteParamModel({
    required this.topicId,
    required this.journalId,
  });

  @override
  Map<String, dynamic> toJson() => _$JournalDeleteParamModelToJson(this);
}
