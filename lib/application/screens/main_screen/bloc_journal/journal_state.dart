part of 'journal_bloc.dart';

@immutable
sealed class JournalState {
  const JournalState();
}

final class JournalInitial extends JournalState {}

final class JournalLoaded extends JournalState {
  final TopicsResponseEntity topicList;
  final JournalsResponseEntity journalList;

  const JournalLoaded({
    required this.topicList,
    required this.journalList,
  });
}
