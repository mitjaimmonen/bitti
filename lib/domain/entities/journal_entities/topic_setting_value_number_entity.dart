import 'package:bitti/domain/entities/entity.dart';

class TopicSettingValueNumberEntity extends Entity {
  final int min;
  final int max;

  TopicSettingValueNumberEntity({
    required this.min,
    required this.max,
  });
}