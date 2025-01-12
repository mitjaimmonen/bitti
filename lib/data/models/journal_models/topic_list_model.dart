import 'package:bitti/data/models/journal_models/topic_entry_model.dart';
import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/journal_entities/topic_list_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_list_model.g.dart';

@JsonSerializable()
class TopicListModel extends Model<TopicListEntity> {
  List<TopicEntryModel> topics;

  TopicListModel({
    required this.topics,
  });

  @override
  Map<String, dynamic> toJson() => _$TopicListModelToJson(this);

  factory TopicListModel.fromJson(Map<String, dynamic> json) =>
      _$TopicListModelFromJson(json);
}
