import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/enums/icon_name.dart';

class AssetIconInfoEntity extends Entity {
  final IconName name;
  final String assetPath;
  final List<String> tags;

  const AssetIconInfoEntity({
    required this.name,
    required this.assetPath,
    required this.tags,
  });
}
