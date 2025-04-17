import 'package:bitti/domain/entities/general/topic_entities/topic_type_number_settings_entity.dart';

class NumberSettingsDialogExtraViewModel {
  final TopicTypeNumberSettingsEntity? numberSettings;

  const NumberSettingsDialogExtraViewModel({
    this.numberSettings,
  });
}

class NumberSettingsDialogReturnViewModel {
  final TopicTypeNumberSettingsEntity numberSettings;

  const NumberSettingsDialogReturnViewModel({
    required this.numberSettings,
  });
}
