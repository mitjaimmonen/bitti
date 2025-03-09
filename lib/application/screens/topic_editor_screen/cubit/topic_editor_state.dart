part of 'topic_editor_cubit.dart';

@immutable
sealed class TopicEditorState {
  const TopicEditorState();
}

final class TopicEditorInitial extends TopicEditorState {
  const TopicEditorInitial();
}

final class TopicEditorLoaded extends TopicEditorState {
  final TopicEntryEntity topicEntry;

  const TopicEditorLoaded({
    required this.topicEntry,
  });

  TopicEditorLoaded copyWith({
    TopicEntryEntity? topicEntry,
  }) {
    return TopicEditorLoaded(
      topicEntry: topicEntry ?? this.topicEntry,
    );
  }
}
