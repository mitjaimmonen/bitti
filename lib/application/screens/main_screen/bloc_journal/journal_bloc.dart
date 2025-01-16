import 'package:bitti/domain/entities/param/set_journal_param_entity.dart';
import 'package:bitti/domain/entities/response/journal_list_response_entity.dart';
import 'package:bitti/domain/entities/response/topic_list_response_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'journal_event.dart';
part 'journal_state.dart';

class JournalBloc extends Bloc<JournalEvent, JournalState> {
  JournalBloc() : super(JournalInitial()) {
    on<JournalLoadEvent>((event, emit) async {
      emit(const JournalLoaded(
        topicList: TopicListEntity(topics: []),
        journalList: JournalListEntity(journals: []),
      ));
    });
    on<JournalEditTopicsEvent>((event, emit) {});
  }
}
