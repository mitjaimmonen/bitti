import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_icon_data_entity.dart';
import 'package:flutter/material.dart';

class TopicIconDataModel extends Model<TopicIconDataEntity> {
  final String assetPath;
  final int color;

  TopicIconDataModel({
    required this.assetPath,
    required this.color,
  });

  TopicIconDataEntity toEntity() {
    return TopicIconDataEntity(
      assetPath: assetPath,
      color: Color(color),
    );
  }

  factory TopicIconDataModel.fromEntity(TopicIconDataEntity entity) {
    return TopicIconDataModel(
      assetPath: entity.assetPath,
      color: entity.color.toARGB32(),
    );
  }
}
