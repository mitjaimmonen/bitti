import 'package:bitti/data/models/general/topic_models/topic_entry_model.dart';
import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/response/topics_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topics_response_model.g.dart';

@JsonSerializable(createToJson: false)
class TopicsResponseModel extends ResponseModel<TopicsResponseEntity> {
  final List<TopicEntryModel> topics;

  const TopicsResponseModel({
    required this.topics,
  });

  @override
  factory TopicsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$TopicsResponseModelFromJson(json);
  }

  @override
  TopicsResponseEntity toEntity() {
    return TopicsResponseEntity(
      topics: topics.map((e) => e.toEntity()).toList(),
    );
  }
}
