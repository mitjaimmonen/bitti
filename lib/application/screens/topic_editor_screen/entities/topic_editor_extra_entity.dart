import 'package:bitti/domain/entities/general/topic_entities/topic_entry_entity.dart';

class TopicEditorExtraEntity {
  final TopicEntryEntity? topicEntry;

  const TopicEditorExtraEntity({
    this.topicEntry,
  });
}

class TopicEditorReturnData {
  final TopicEntryEntity? topicEntry;
  final bool delete;

  const TopicEditorReturnData({
    this.topicEntry,
    this.delete = false,
  });
}
