import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/general/asset_icon_info_entity.dart';

class IconsInfoResponseEntity extends ResponseEntity {
  final List<AssetIconInfoEntity> iconsInfo;

  const IconsInfoResponseEntity({
    required this.iconsInfo,
  });
}
