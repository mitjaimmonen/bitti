import 'package:bitti/data/models/general/journal_models/journal_entry_model_base.dart';
import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/response/journal_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/journal_response_model.g.dart';

@JsonSerializable(createToJson: false)
class JournalResponseModel extends ResponseModel<JournalResponseEntity> {
  final JournalEntryModelBase journal;

  const JournalResponseModel({
    required this.journal,
  });

  @override
  ResponseModel<ResponseEntity> fromJson(Map<String, dynamic> json) {
    return _$JournalResponseModelFromJson(json);
  }
}
