import 'package:bitti/data/data_sources/interfaces/icon_data_source.dart';
import 'package:bitti/data/mappers/icon_info_data_mapper.dart';
import 'package:bitti/data/models/general/icon_entry_model.dart';
import 'package:bitti/data/models/param/icon_read_param_model.dart';
import 'package:bitti/data/models/param/icons_search_param_model.dart';
import 'package:bitti/data/models/response/icon_response_model.dart';
import 'package:bitti/data/models/response/icons_data_response_model.dart';
import 'package:flutter/services.dart';

class AssetIconDataSource extends IconDataSource {
  @override
  Future<IconResponseModel> readIcon(IconReadParamModel params) async {
    final iconInfo = IconInfoDataMapper.getIconInfo(params.name);
    final ByteData byteData = await rootBundle.load(iconInfo.assetPath);
    final Uint8List iconData = byteData.buffer.asUint8List();

    return IconResponseModel(entry: IconEntryModel(icon: iconData));
  }

  @override
  Future<IconsInfoResponseModel> searchIcons(
      IconsSearchParamModel params) async {
    final query = params.query.toLowerCase();
    final iconsInfo = IconInfoDataMapper.iconsInfo;

    final matchingIcons = iconsInfo.where((iconInfo) {
      final nameMatches = iconInfo.name.toLowerCase().contains(query);
      final tagsMatch =
          iconInfo.tags.any((tag) => tag.toLowerCase().contains(query));
      return nameMatches || tagsMatch;
    }).toList();

    return IconsInfoResponseModel(iconsInfo: matchingIcons);
  }
}
