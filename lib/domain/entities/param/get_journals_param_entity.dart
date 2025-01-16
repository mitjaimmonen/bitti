import 'package:bitti/domain/entities/entity.dart';

class GetJournalsParamEntity extends Entity {
  final int topicId;
  final DateTime? startDate;
  final DateTime? endDate;

  const GetJournalsParamEntity({
    required this.topicId,
    this.startDate,
    this.endDate,
  });
}
