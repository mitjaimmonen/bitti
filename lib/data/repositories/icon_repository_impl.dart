import 'package:bitti/data/data_sources/interfaces/icon_data_source.dart';
import 'package:bitti/data/models/param/icon_read_param_model.dart';
import 'package:bitti/data/models/param/icons_search_param_model.dart';
import 'package:bitti/domain/entities/param/icon_read_param_entity.dart';
import 'package:bitti/domain/entities/param/icons_search_param_entity.dart';
import 'package:bitti/domain/entities/response/icon_response_entity.dart';
import 'package:bitti/domain/entities/response/icons_data_response_entity.dart';
import 'package:bitti/domain/failures/failure.dart';
import 'package:bitti/domain/repositories/icon_repository.dart';
import 'package:either_dart/either.dart';

class IconRepositoryImpl extends IconRepository {
  final IconDataSource dataSource;

  IconRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, IconResponseEntity>> readIcon(
      IconReadParamEntity params) async {
    try {
      final response =
          await dataSource.readIcon(IconReadParamModel.fromEntity(params));
      return Right(response.toEntity());
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, IconsInfoResponseEntity>> searchIcons(
      IconsSearchParamEntity params) async {
    try {
      final response = await dataSource
          .searchIcons(IconsSearchParamModel.fromEntity(params));
      return Right(response.toEntity());
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
