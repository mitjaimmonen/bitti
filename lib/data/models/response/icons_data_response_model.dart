import 'package:bitti/data/models/general/asset_icon_info_model.dart';
import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/response/icons_data_response_entity.dart';

class IconsInfoResponseModel extends ResponseModel<IconsInfoResponseEntity> {
  final List<AssetIconInfoModel> iconsInfo;

  const IconsInfoResponseModel({
    required this.iconsInfo,
  });

  @override
  IconsInfoResponseEntity toEntity() {
    return IconsInfoResponseEntity(
      iconsInfo: iconsInfo.map((e) => e.toEntity()).toList(),
    );
  }
}
