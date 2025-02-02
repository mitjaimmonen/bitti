import 'package:bitti/data/models/general/topic_models/topic_entry_model.dart';
import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/response/topic_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_response_model.g.dart';

@JsonSerializable(createToJson: false)
class TopicResponseModel extends ResponseModel<TopicResponseEntity> {
  final TopicEntryModel topic;

  const TopicResponseModel({
    required this.topic,
  });

  @override
  factory TopicResponseModel.fromJson(Map<String, dynamic> json) {
    return _$TopicResponseModelFromJson(json);
  }

  @override
  TopicResponseEntity toEntity() {
    return TopicResponseEntity(
      topic: topic.toEntity(),
    );
  }
}
