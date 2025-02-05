import 'package:bitti/data/models/general/icon_entry_model.dart';
import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/response/icon_response_entity.dart';

class IconResponseModel extends ResponseModel<IconResponseEntity> {
  final IconEntryModel entry;

  const IconResponseModel({
    required this.entry,
  });

  @override
  IconResponseEntity toEntity() {
    return IconResponseEntity(
      entry: entry.toEntity(),
    );
  }
}
