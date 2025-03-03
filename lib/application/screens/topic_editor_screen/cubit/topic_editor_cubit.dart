import 'package:bitti/domain/entities/general/topic_entities/topic_entry_entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_note_settings_entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_number_settings_entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_settings_entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_toggle_settings_entity.dart';
import 'package:bitti/domain/enums/topic_type.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'topic_editor_state.dart';

class TopicEditorCubit extends Cubit<TopicEditorState> {
  TopicEditorCubit() : super(TopicEditorInitial());

  void updateTopicEntry({
    int? id,
    String? name,
    String? description,
    DateTime? startDate,
    String? iconName,
    Color? color,
    TopicType? topicType,
    TopicTypeSettingsEntity? topicTypeSettings,
  }) {
    if (state is TopicEditorLoaded) {
      final s = state as TopicEditorLoaded;
      emit(s.copyWith(
        topicEntry: s.topicEntry.copyWith(
          name: name,
          description: description,
          startDate: startDate,
          iconName: iconName,
          color: color,
          topicType: topicType,
          topicTypeSettings: topicTypeSettings,
        ),
      ));
    }
  }

  void updateNumberSettings(TopicTypeNumberSettingsEntity settings) {
    if (state is TopicEditorLoaded) {
      final s = state as TopicEditorLoaded;
      emit(s.copyWith(settings: s.settings.copyWith(numberSettings: settings)));
    }
  }

  void updateToggleSettings(TopicTypeToggleSettingsEntity settings) {
    if (state is TopicEditorLoaded) {
      final s = state as TopicEditorLoaded;
      emit(s.copyWith(settings: s.settings.copyWith(toggleSettings: settings)));
    }
  }

  void updateNoteSettings(TopicTypeNoteSettingsEntity settings) {
    if (state is TopicEditorLoaded) {
      final s = state as TopicEditorLoaded;
      emit(s.copyWith(settings: s.settings.copyWith(noteSettings: settings)));
    }
  }
}
