import 'package:bitti/domain/entities/general/topic_entities/topic_entry_entity.dart';

class TopicEditorExtraViewModel {
  final TopicEntryEntity? topicEntry;

  const TopicEditorExtraViewModel({
    this.topicEntry,
  });
}

class TopicEditorReturnViewModel {
  final TopicEntryEntity? topicEntry;
  final bool delete;

  const TopicEditorReturnViewModel({
    this.topicEntry,
    this.delete = false,
  });
}
