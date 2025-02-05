import 'package:bitti/data/data_sources/data_source.dart';
import 'package:bitti/data/models/param/icon_read_param_model.dart';
import 'package:bitti/data/models/param/icons_search_param_model.dart';
import 'package:bitti/data/models/response/icon_response_model.dart';
import 'package:bitti/data/models/response/icons_data_response_model.dart';

abstract class IconDataSource extends DataSource {
  Future<IconsInfoResponseModel> searchIcons(IconsSearchParamModel params);
  Future<IconResponseModel> readIcon(IconReadParamModel params);
}
