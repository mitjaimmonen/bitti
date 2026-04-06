import 'package:bitti/domain/entities/entity.dart';

class JournalDeleteParamEntity extends ParamEntity {
  final int journalId;
  final int topicId;

  const JournalDeleteParamEntity({
    required this.journalId,
    required this.topicId,
  });
}
