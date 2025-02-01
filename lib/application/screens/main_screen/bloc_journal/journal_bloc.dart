import 'package:bitti/domain/entities/param/journal_update_param_entity.dart';
import 'package:bitti/domain/entities/response/journals_response_entity.dart';
import 'package:bitti/domain/entities/response/topics_response_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'journal_event.dart';
part 'journal_state.dart';

class JournalBloc extends Bloc<JournalEvent, JournalState> {
  JournalBloc() : super(JournalInitial()) {
    on<JournalLoadEvent>((event, emit) async {
      emit(const JournalLoaded(
        topicList: TopicsResponseEntity(topics: []),
        journalList: JournalsResponseEntity(journals: []),
      ));
    });
  }
}
