import 'package:bitti/domain/entities/param/icons_search_param_entity.dart';
import 'package:bitti/domain/entities/response/icons_data_response_entity.dart';
import 'package:bitti/domain/failures/failure.dart';
import 'package:bitti/domain/repositories/icon_repository.dart';
import 'package:bitti/domain/use_cases/use_case.dart';
import 'package:either_dart/either.dart';

class SearchIconsUseCase
    extends UseCase<IconsInfoResponseEntity, IconsSearchParamEntity> {
  final IconRepository repository;

  SearchIconsUseCase({required this.repository});

  @override
  Future<Either<Failure, IconsInfoResponseEntity>> call(
      IconsSearchParamEntity params) async {
    return await repository.searchIcons(params);
  }
}
