import 'package:bitti/data/models/general/journal_models/journal_entry_model.dart';
import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/response/journal_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/journal_response_model.g.dart';

@JsonSerializable(createToJson: false)
class JournalResponseModel extends ResponseModel<JournalResponseEntity> {
  final JournalEntryModel journal;

  const JournalResponseModel({
    required this.journal,
  });

  @override
  factory JournalResponseModel.fromJson(Map<String, dynamic> json) {
    return _$JournalResponseModelFromJson(json);
  }

  @override
  JournalResponseEntity toEntity() {
    return JournalResponseEntity(journal: journal.toEntity());
  }
}
