import 'package:bitti/data/models/model.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/color_data_model.g.dart';

/// [ColorDataModel] is used to transform color information losslessly between
/// JSON and Material [Color].
///
/// This model class provides methods to convert a [Color] object to a JSON
/// representation and vice versa.
@JsonSerializable()
class ColorDataModel extends Model {
  final double a;
  final double r;
  final double g;
  final double b;

  const ColorDataModel({
    required this.a,
    required this.r,
    required this.g,
    required this.b,
  });

  factory ColorDataModel.fromColor(Color color) {
    return ColorDataModel(
      a: color.a.toDouble(),
      r: color.r.toDouble(),
      g: color.g.toDouble(),
      b: color.b.toDouble(),
    );
  }

  Color toColor() {
    return Color.from(alpha: a, red: r, green: g, blue: b);
  }

  Map<String, dynamic> toJson() => _$ColorDataModelToJson(this);

  factory ColorDataModel.fromJson(Map<String, dynamic> json) =>
      _$ColorDataModelFromJson(json);
}
