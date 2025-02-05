import 'package:bitti/domain/entities/param/icon_read_param_entity.dart';
import 'package:bitti/domain/entities/param/icons_search_param_entity.dart';
import 'package:bitti/domain/entities/response/icon_response_entity.dart';
import 'package:bitti/domain/entities/response/icons_data_response_entity.dart';
import 'package:bitti/domain/failures/failure.dart';
import 'package:bitti/domain/repositories/repository.dart';
import 'package:either_dart/either.dart';

abstract class IconRepository extends Repository {
  Future<Either<Failure, IconResponseEntity>> readIcon(
      IconReadParamEntity params);
  Future<Either<Failure, IconsInfoResponseEntity>> searchIcons(
      IconsSearchParamEntity params);
}
