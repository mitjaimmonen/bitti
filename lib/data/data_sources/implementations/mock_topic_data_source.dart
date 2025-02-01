import 'package:bitti/data/data_sources/interfaces/topic_data_source.dart';
import 'package:bitti/data/models/param/topic_create_param_model.dart';
import 'package:bitti/data/models/param/topic_delete_param_model.dart';
import 'package:bitti/data/models/param/topic_update_param_model.dart';
import 'package:bitti/data/models/param/topics_read_param_model.dart';
import 'package:bitti/data/models/response/topic_response_model.dart';
import 'package:bitti/data/models/response/topics_response_model.dart';

class MockTopicDataSource extends TopicDataSource {
  @override
  Future<TopicResponseModel> create(TopicCreateParamModel params) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<TopicResponseModel> delete(TopicDeleteParamModel params) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<TopicsResponseModel> readAll(TopicsReadParamModel params) {
    // TODO: implement readAll
    throw UnimplementedError();
  }

  @override
  Future<TopicResponseModel> update(TopicUpdateParamModel params) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
