part of 'journal_bloc.dart';

@immutable
sealed class JournalEvent {
  const JournalEvent();
}

final class JournalLoadEvent extends JournalEvent {
  const JournalLoadEvent();
}

final class JournalEditJournalEvent extends JournalEvent {
  final JournalUpdateParamEntity setJournalParam;

  const JournalEditJournalEvent({
    required this.setJournalParam,
  });
}
