part of 'topics_bloc.dart';

@immutable
sealed class TopicsState {}

final class TopicsInitial extends TopicsState {}

final class TopicsEditingTopic extends TopicsState {
  final TopicEntryEntity? topic;

  TopicsEditingTopic({
    required this.topic,
  });
}
