import 'package:bitti/domain/entities/entity.dart';

abstract class Model<T extends Entity> {
  const Model();

  Map<String, dynamic> toJson();

  factory Model.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('fromJson is not implemented');
  }
}
