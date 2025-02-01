import 'package:bitti/data/models/general/journal_models/journal_entry_model.dart';
import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/response/journals_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/journals_response_model.g.dart';

@JsonSerializable(createToJson: false)
class JournalsResponseModel extends ResponseModel<JournalsResponseEntity> {
  final List<JournalEntryModel> journals;

  const JournalsResponseModel({
    required this.journals,
  });

  @override
  factory JournalsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$JournalsResponseModelFromJson(json);
  }
}
