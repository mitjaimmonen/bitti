import 'dart:convert';

import 'package:bitti/data/data_sources/interfaces/topic_data_source.dart';
import 'package:bitti/data/exceptions/exceptions.dart';
import 'package:bitti/data/models/general/topic_models/topic_entry_model.dart';
import 'package:bitti/data/models/param/topic_create_param_model.dart';
import 'package:bitti/data/models/param/topic_delete_param_model.dart';
import 'package:bitti/data/models/param/topic_update_param_model.dart';
import 'package:bitti/data/models/param/topics_read_param_model.dart';
import 'package:bitti/data/models/response/topic_response_model.dart';
import 'package:bitti/data/models/response/topics_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:localstorage/localstorage.dart';

class LocalTopicDataSource extends TopicDataSource {
  @override
  Future<void> open() async {
    await initLocalStorage();
  }

  @override
  Future<TopicResponseModel> create(TopicCreateParamModel params) async {
    try {
      final topicsString = localStorage.getItem('topics');
      final List<TopicEntryModel> topicsData;

      if (topicsString != null) {
        final jsonList = jsonDecode(topicsString) as List;
        topicsData = jsonList.map((e) => TopicEntryModel.fromJson(e)).toList();
      } else {
        topicsData = [];
      }

      if (topicsData.any((topic) => topic.id == params.topic.id)) {
        throw BadRequestException(
            'Topic already exists, please update it instead');
      }

      topicsData.add(params.topic);
      final json = topicsData.map((e) => e.toJson()).toList();
      localStorage.setItem('topics', jsonEncode(json));

      return TopicResponseModel(topic: params.topic);
    } catch (e) {
      if (kDebugMode) print(e);
      throw DataSourceException('Failed to create topic');
    }
  }

  /// Make sure to delete the journals that are associated with the topic
  @override
  Future<TopicResponseModel> delete(TopicDeleteParamModel params) async {
    try {
      final topicsString = localStorage.getItem('topics');
      final List<TopicEntryModel> topicsData;

      if (topicsString != null) {
        final jsonList = jsonDecode(topicsString) as List;
        topicsData = jsonList.map((e) => TopicEntryModel.fromJson(e)).toList();
      } else {
        throw NotFoundException('No topics found');
      }

      final topicIndex = topicsData.indexWhere((topic) {
        return topic.id == params.id;
      });

      if (topicIndex == -1) {
        throw NotFoundException('Topic not found');
      }

      final topicEntry = topicsData[topicIndex];
      topicsData.removeAt(topicIndex);
      final json = topicsData.map((e) => e.toJson()).toList();
      localStorage.setItem('topics', jsonEncode(json));

      return TopicResponseModel(topic: topicEntry);
    } catch (e) {
      if (kDebugMode) print(e);
      throw DataSourceException('Failed to delete topic');
    }
  }

  @override
  Future<TopicsResponseModel> readAll(TopicsReadParamModel params) async {
    try {
      final topicsString = localStorage.getItem('topics');
      final List<TopicEntryModel> topicsData;

      if (topicsString != null) {
        final jsonList = jsonDecode(topicsString) as List;
        topicsData = jsonList.map((e) => TopicEntryModel.fromJson(e)).toList();
      } else {
        throw NotFoundException('No topics found');
      }

      return TopicsResponseModel(topics: topicsData);
    } catch (e) {
      if (kDebugMode) print(e);
      throw DataSourceException('Failed to read topics');
    }
  }

  @override
  Future<TopicResponseModel> update(TopicUpdateParamModel params) async {
    try {
      final topicsString = localStorage.getItem('topics');
      final List<TopicEntryModel> topicsData;

      if (topicsString != null) {
        final jsonList = jsonDecode(topicsString) as List;
        topicsData = jsonList.map((e) => TopicEntryModel.fromJson(e)).toList();
      } else {
        throw NotFoundException('No topics found');
      }

      final topicIndex = topicsData.indexWhere((topic) {
        return topic.id == params.topic.id;
      });

      if (topicIndex == -1) {
        throw NotFoundException('Topic not found');
      }

      topicsData[topicIndex] = params.topic;
      final json = topicsData.map((e) => e.toJson()).toList();
      localStorage.setItem('topics', jsonEncode(json));

      return TopicResponseModel(topic: params.topic);
    } catch (e) {
      if (kDebugMode) print(e);
      throw DataSourceException('Failed to update topic');
    }
  }
}
