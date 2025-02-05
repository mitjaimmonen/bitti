import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/param/icon_read_param_entity.dart';
import 'package:bitti/domain/enums/icon_name.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/icon_read_param_model.g.dart';

@JsonSerializable(createFactory: false)
class IconReadParamModel extends ParamModel<IconReadParamEntity> {
  final IconName name;

  const IconReadParamModel({
    required this.name,
  });

  @override
  Map<String, dynamic> toJson() => _$IconReadParamModelToJson(this);

  factory IconReadParamModel.fromEntity(IconReadParamEntity entity) {
    return IconReadParamModel(
      name: entity.name,
    );
  }
}
