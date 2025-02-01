import 'dart:convert';

import 'package:bitti/data/data_sources/interfaces/topic_data_source.dart';
import 'package:bitti/data/models/general/topic_models/topic_list_model.dart';
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
      final TopicListModel topicsData;

      if (topicsString != null) {
        topicsData = TopicListModel.fromJson(jsonDecode(topicsString));
      } else {
        topicsData = TopicListModel(topics: []);
      }

      if (topicsData.topics.any((topic) => topic.id == params.topic.id)) {
        throw Exception('Topic already exists, please update it instead');
      }

      topicsData.topics.add(params.topic);
      final json = topicsData.toJson();
      localStorage.setItem('topics', jsonEncode(json));

      return TopicResponseModel(topic: params.topic);
    } catch (e) {
      if (kDebugMode) print(e);
      throw Exception('Failed to create topic');
    }
  }

  @override
  Future<TopicResponseModel> delete(TopicDeleteParamModel params) async {
    try {
      final topicsString = localStorage.getItem('topics');
      final TopicListModel topicsData;

      if (topicsString != null) {
        topicsData = TopicListModel.fromJson(jsonDecode(topicsString));
      } else {
        throw Exception('No topics found');
      }

      final topicIndex = topicsData.topics.indexWhere((topic) {
        return topic.id == params.id;
      });

      if (topicIndex == -1) {
        throw Exception('Topic not found');
      }

      final topicEntry = topicsData.topics[topicIndex];
      topicsData.topics.removeAt(topicIndex);
      final json = topicsData.toJson();
      localStorage.setItem('topics', jsonEncode(json));

      return TopicResponseModel(topic: topicEntry);
    } catch (e) {
      if (kDebugMode) print(e);
      throw Exception('Failed to delete topic');
    }
  }

  @override
  Future<TopicsResponseModel> readAll(TopicsReadParamModel params) async {
    try {
      final topicsString = localStorage.getItem('topics');
      final TopicListModel topicsData;

      if (topicsString != null) {
        topicsData = TopicListModel.fromJson(jsonDecode(topicsString));
      } else {
        throw Exception('No topics found');
      }

      return TopicsResponseModel(topics: topicsData.topics);
    } catch (e) {
      if (kDebugMode) print(e);
      throw Exception('Failed to read topics');
    }
  }

  @override
  Future<TopicResponseModel> update(TopicUpdateParamModel params) async {
    try {
      final topicsString = localStorage.getItem('topics');
      final TopicListModel topicsData;

      if (topicsString != null) {
        topicsData = TopicListModel.fromJson(jsonDecode(topicsString));
      } else {
        throw Exception('No topics found');
      }

      final topicIndex = topicsData.topics.indexWhere((topic) {
        return topic.id == params.topic.id;
      });

      if (topicIndex == -1) {
        throw Exception('Topic not found');
      }

      topicsData.topics[topicIndex] = params.topic;
      final json = topicsData.toJson();
      localStorage.setItem('topics', jsonEncode(json));

      return TopicResponseModel(topic: params.topic);
    } catch (e) {
      if (kDebugMode) print(e);
      throw Exception('Failed to update topic');
    }
  }
}
