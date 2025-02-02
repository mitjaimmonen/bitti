import 'package:bitti/data/models/general/journal_models/journal_entry_model.dart';
import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/param/journal_create_param_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/journal_create_param_model.g.dart';

@JsonSerializable(createFactory: false)
class JournalCreateParamModel extends ParamModel<JournalCreateParamEntity> {
  final int topicId;
  final JournalEntryModel journal;

  const JournalCreateParamModel({
    required this.topicId,
    required this.journal,
  });

  @override
  Map<String, dynamic> toJson() => _$JournalCreateParamModelToJson(this);

  factory JournalCreateParamModel.fromEntity(JournalCreateParamEntity entity) {
    return JournalCreateParamModel(
      topicId: entity.topicId,
      journal: JournalEntryModel.fromEntity(entity.journal),
    );
  }
}
