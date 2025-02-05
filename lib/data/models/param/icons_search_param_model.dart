import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/param/icon_read_param_entity.dart';
import 'package:bitti/domain/entities/param/icons_search_param_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/icons_search_param_model.g.dart';

@JsonSerializable(createFactory: false)
class IconsSearchParamModel extends ParamModel<IconReadParamEntity> {
  final String query;

  const IconsSearchParamModel({
    required this.query,
  });

  @override
  Map<String, dynamic> toJson() => _$IconsSearchParamModelToJson(this);

  factory IconsSearchParamModel.fromEntity(IconsSearchParamEntity entity) {
    return IconsSearchParamModel(
      query: entity.query.toString(),
    );
  }
}
