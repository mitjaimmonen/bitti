part of 'topics_bloc.dart';

@immutable
sealed class TopicsEvent {
  const TopicsEvent();
}

class LoadTopicsEvent extends TopicsEvent {
  const LoadTopicsEvent();
}

class ReorderTopicEvent extends TopicsEvent {
  final int oldIndex;
  final int newIndex;

  const ReorderTopicEvent({
    required this.oldIndex,
    required this.newIndex,
  });
}

class DeleteTopicEvent extends TopicsEvent {
  final int index;

  const DeleteTopicEvent({
    required this.index,
  });
}

class AddTopicEvent extends TopicsEvent {
  final TopicEntryEntity topic;

  const AddTopicEvent({
    required this.topic,
  });
}
