part of 'journal_bloc.dart';

@immutable
sealed class JournalState {
  const JournalState();
}

final class JournalInitial extends JournalState {}

final class JournalLoaded extends JournalState {
  final Map<TopicEntryEntity, List<JournalEntryEntity>> journalMap;

  const JournalLoaded({
    required this.journalMap,
  });
}

final class JournalErrored extends JournalState {
  const JournalErrored();
}
