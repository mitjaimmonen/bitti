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
  final TopicTypeSettingsEntity settings;

  const TopicEditorLoaded({
    required this.topicEntry,
    required this.settings,
  });

  TopicEditorLoaded copyWith({
    TopicEntryEntity? topicEntry,
    TopicTypeSettingsEntity? settings,
  }) {
    return TopicEditorLoaded(
      topicEntry: topicEntry ?? this.topicEntry,
      settings: settings ?? this.settings,
    );
  }
}
