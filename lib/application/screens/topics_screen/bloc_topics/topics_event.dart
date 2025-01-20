part of 'topics_bloc.dart';

@immutable
sealed class TopicsEvent {}

class ReorderTopicEvent extends TopicsEvent {
  final int oldIndex;
  final int newIndex;

  ReorderTopicEvent({
    required this.oldIndex,
    required this.newIndex,
  });
}

class DeleteTopicEvent extends TopicsEvent {
  final int index;

  DeleteTopicEvent({
    required this.index,
  });
}
