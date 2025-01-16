part of 'journal_bloc.dart';

@immutable
sealed class JournalEvent {
  const JournalEvent();
}

final class JournalLoadEvent extends JournalEvent {
  const JournalLoadEvent();
}

final class JournalEditTopicsEvent extends JournalEvent {
  const JournalEditTopicsEvent();
}

final class JournalEditJournalEvent extends JournalEvent {
  final SetJournalParamEntity setJournalParam;

  const JournalEditJournalEvent({
    required this.setJournalParam,
  });
}
