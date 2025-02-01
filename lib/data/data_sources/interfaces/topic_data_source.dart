import 'package:bitti/data/data_sources/data_source.dart';
import 'package:bitti/data/models/param/topic_create_param_model.dart';
import 'package:bitti/data/models/param/topic_delete_param_model.dart';
import 'package:bitti/data/models/param/topic_update_param_model.dart';
import 'package:bitti/data/models/param/topics_read_param_model.dart';
import 'package:bitti/data/models/response/topic_response_model.dart';
import 'package:bitti/data/models/response/topics_response_model.dart';

abstract class TopicDataSource extends DataSource {
  Future<TopicResponseModel> create(TopicCreateParamModel params);
  Future<TopicsResponseModel> readAll(TopicsReadParamModel params);
  Future<TopicResponseModel> update(TopicUpdateParamModel params);
  Future<TopicResponseModel> delete(TopicDeleteParamModel params);
}
