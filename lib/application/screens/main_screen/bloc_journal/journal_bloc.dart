import 'dart:async';

import 'package:bitti/domain/entities/general/journal_entities/journal_entry_entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_entry_entity.dart';
import 'package:bitti/domain/entities/param/journal_update_param_entity.dart';
import 'package:bitti/domain/entities/param/journals_read_param_entity.dart';
import 'package:bitti/domain/entities/param/topics_read_param_entity.dart';
import 'package:bitti/domain/repositories/journal_repository.dart';
import 'package:bitti/domain/repositories/topic_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'journal_event.dart';
part 'journal_state.dart';

class JournalBloc extends Bloc<JournalEvent, JournalState> {
  final JournalRepository journalRepository;
  final TopicRepository topicRepository;

  JournalBloc({
    required this.journalRepository,
    required this.topicRepository,
  }) : super(JournalInitial()) {
    on<JournalLoadEvent>(_onLoad);
  }

  Future<void> _onLoad(
    JournalLoadEvent event,
    Emitter<JournalState> emit,
  ) async {
    final topicsResult =
        await topicRepository.readTopics(TopicsReadParamEntity());
    await topicsResult.fold(
      (left) {
        emit(JournalErrored());
      },
      (rightT) async {
        Map<TopicEntryEntity, List<JournalEntryEntity>> journalMap = {};
        for (int i = 0; i < rightT.topics.length; i++) {
          final topic = rightT.topics[i];
          final journalResult = await journalRepository.readJournals(
            JournalsReadParamEntity(topicId: rightT.topics[i].id),
          );

          journalResult.fold(
            (left) {
              journalMap[topic] = [];
            },
            (rightJ) {
              journalMap[topic] = rightJ.journals;
            },
          );
        }

        emit(JournalLoaded(journalMap: journalMap));
      },
    );
  }
}
