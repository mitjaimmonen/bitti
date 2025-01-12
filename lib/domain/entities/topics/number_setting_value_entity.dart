import 'package:bitti/domain/entities/entity.dart';

class NumberSettingValueEntity extends Entity {
  final int min;
  final int max;

  NumberSettingValueEntity({
    required this.min,
    required this.max,
  });
}
