import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/general/asset_icon_info_entity.dart';
import 'package:bitti/domain/enums/icon_name.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/asset_icon_info_model.g.dart';

@JsonSerializable()
class AssetIconInfoModel extends Model<AssetIconInfoEntity> {
  final String name;
  final String assetPath;
  final List<String> tags;

  const AssetIconInfoModel({
    required this.name,
    required this.assetPath,
    required this.tags,
  });

  Map<String, dynamic> toJson() => _$AssetIconInfoModelToJson(this);

  factory AssetIconInfoModel.fromJson(Map<String, dynamic> json) =>
      _$AssetIconInfoModelFromJson(json);

  AssetIconInfoEntity toEntity() {
    return AssetIconInfoEntity(
      name: IconName.fromString(name),
      assetPath: assetPath,
      tags: tags,
    );
  }

  factory AssetIconInfoModel.fromEntity(AssetIconInfoEntity entity) {
    return AssetIconInfoModel(
      name: entity.name.toString(),
      assetPath: entity.assetPath,
      tags: entity.tags,
    );
  }
}
