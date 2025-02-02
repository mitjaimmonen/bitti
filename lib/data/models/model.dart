import 'package:bitti/domain/entities/entity.dart';

abstract class Model<T extends Entity> {
  const Model();
}

abstract class ParamModel<T extends ParamEntity> extends Model<T> {
  const ParamModel();

  Map<String, dynamic> toJson();
}

abstract class ResponseModel<T extends ResponseEntity> extends Model<T> {
  const ResponseModel();

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  T toEntity();
}
