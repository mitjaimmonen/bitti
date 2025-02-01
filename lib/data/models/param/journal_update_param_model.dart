import 'package:bitti/data/models/general/journal_models/journal_entry_model_base.dart';
import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/param/journal_update_param_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/journal_update_param_model.g.dart';

@JsonSerializable(createFactory: false)
class JournalUpdateParamModel extends ParamModel<JournalUpdateParamEntity> {
  final int topicId;
  final JournalEntryModelBase journalEntry;

  const JournalUpdateParamModel({
    required this.topicId,
    required this.journalEntry,
  });

  @override
  Map<String, dynamic> toJson() => _$JournalUpdateParamModelToJson(this);
}
