import 'package:bitti/domain/entities/entity.dart';

class TopicTypeNumberSettingsEntity extends Entity {
  final int min;
  final int max;

  const TopicTypeNumberSettingsEntity({
    required this.min,
    required this.max,
  });

  TopicTypeNumberSettingsEntity copyWith({
    int? min,
    int? max,
  }) {
    return TopicTypeNumberSettingsEntity(
      min: min ?? this.min,
      max: max ?? this.max,
    );
  }
}
