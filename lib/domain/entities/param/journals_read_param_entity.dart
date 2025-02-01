import 'package:bitti/domain/entities/entity.dart';

class JournalsReadParamEntity extends ParamEntity {
  final int topicId;
  final DateTime? startDate;
  final DateTime? endDate;

  const JournalsReadParamEntity({
    required this.topicId,
    this.startDate,
    this.endDate,
  });
}
