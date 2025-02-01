import 'package:bitti/data/models/general/topic_models/topic_entry_model.dart';
import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/response/topics_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_list_model.g.dart';

@JsonSerializable()
class TopicListModel extends Model<TopicsResponseEntity> {
  List<TopicEntryModel> topics;

  TopicListModel({
    required this.topics,
  });

  @override
  Map<String, dynamic> toJson() => _$TopicListModelToJson(this);

  factory TopicListModel.fromJson(Map<String, dynamic> json) =>
      _$TopicListModelFromJson(json);
}
