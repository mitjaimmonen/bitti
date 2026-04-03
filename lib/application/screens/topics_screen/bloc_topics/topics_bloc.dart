import 'dart:async';

import 'package:bitti/domain/entities/general/topic_entities/topic_entry_entity.dart';
import 'package:bitti/domain/entities/param/topic_create_param_entity.dart';
import 'package:bitti/domain/entities/param/topics_read_param_entity.dart';
import 'package:bitti/domain/repositories/topic_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'topics_event.dart';
part 'topics_state.dart';

class TopicsBloc extends Bloc<TopicsEvent, TopicsState> {
  final TopicRepository topicRepository;

  TopicsBloc({required this.topicRepository}) : super(TopicsInitial()) {
    on<LoadTopicsEvent>(_loadTopics);
    on<AddTopicEvent>(_addTopic);
    on<DeleteTopicEvent>(_deleteTopic);
  }

  Future<void> _loadTopics(
      LoadTopicsEvent event, Emitter<TopicsState> emit) async {
    emit(TopicsLoading());
    final result = await topicRepository.readTopics(TopicsReadParamEntity());
    result.fold(
      (left) => emit(TopicsErrored()),
      (right) => emit(TopicsLoaded(topics: right.topics)),
    );
  }

  Future<void> _addTopic(AddTopicEvent event, Emitter<TopicsState> emit) async {
    final createResult = await topicRepository
        .createTopic(TopicCreateParamEntity(topic: event.topic));
    await createResult.fold(
      (left) => null,
      (right) async {
        final readResult =
            await topicRepository.readTopics(TopicsReadParamEntity());
        readResult.fold(
          (left) => emit(TopicsErrored()),
          (right) => emit(TopicsLoaded(topics: right.topics)),
        );
      },
    );
  }

  FutureOr<void> _deleteTopic(
    DeleteTopicEvent event,
    Emitter<TopicsState> emit,
  ) {}
}
