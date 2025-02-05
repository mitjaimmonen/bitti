import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/general/asset_icon_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/asset_icon_data_model.g.dart';

@JsonSerializable()
class AssetIconDataModel extends Model<AssetIconDataEntity> {
  final String assetPath;
  final int color;

  AssetIconDataModel({
    required this.assetPath,
    required this.color,
  });

  Map<String, dynamic> toJson() => _$AssetIconDataModelToJson(this);

  factory AssetIconDataModel.fromJson(Map<String, dynamic> json) =>
      _$AssetIconDataModelFromJson(json);

  AssetIconDataEntity toEntity() {
    return AssetIconDataEntity(
      assetPath: assetPath,
      color: Color(color),
    );
  }

  factory AssetIconDataModel.fromEntity(AssetIconDataEntity entity) {
    return AssetIconDataModel(
      assetPath: entity.assetPath,
      color: entity.color.toARGB32(),
    );
  }
}
