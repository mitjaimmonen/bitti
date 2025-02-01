import 'package:bitti/domain/entities/entity.dart';

class JournalDeleteParamEntity extends ParamEntity {
  final int journalId;

  const JournalDeleteParamEntity({
    required this.journalId,
  });
}
