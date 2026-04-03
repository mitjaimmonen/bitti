part of 'topics_bloc.dart';

@immutable
sealed class TopicsState {}

final class TopicsInitial extends TopicsState {}

final class TopicsLoading extends TopicsState {}

final class TopicsErrored extends TopicsState {}

final class TopicsLoaded extends TopicsState {
  final List<TopicEntryEntity>? topics;

  TopicsLoaded({
    required this.topics,
  });
}
