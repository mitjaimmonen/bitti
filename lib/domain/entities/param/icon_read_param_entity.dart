import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/enums/icon_name.dart';

class IconReadParamEntity extends ParamEntity {
  final IconName name;

  const IconReadParamEntity({
    required this.name,
  });
}
