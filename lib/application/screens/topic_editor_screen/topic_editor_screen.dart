import 'package:bitti/application/models/screen_config_model.dart';
import 'package:bitti/domain/entities/general/asset_icon_data_entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_entry_entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_settings_entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_toggle_settings_entity.dart';
import 'package:bitti/domain/enums/topic_type.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopicEditorExtraData {
  final TopicEntryEntity? topicEntry;

  const TopicEditorExtraData({
    this.topicEntry,
  });
}

class TopicEditorReturnData {
  final TopicEntryEntity? topicEntry;
  final bool delete;

  const TopicEditorReturnData({
    this.topicEntry,
    this.delete = false,
  });
}

class TopicEditorScreen extends StatefulWidget {
  final TopicEditorExtraData extra;

  static const config = ScreenConfigModel(
    title: 'Topic Editor',
    routePath: '/topic-editor',
  );

  const TopicEditorScreen({
    super.key,
    required this.extra,
  });

  @override
  TopicEditorScreenState createState() => TopicEditorScreenState();
}

class TopicEditorScreenState extends State<TopicEditorScreen> {
  final _formKey = GlobalKey<FormState>();
  late int id;
  late String name;
  late String description;
  late DateTime startDate;
  late AssetIconDataEntity icon;
  late Color color;
  late TopicType topicType;
  late TopicTypeSettingsEntity topicTypeSettings;

  @override
  void initState() {
    super.initState();
    final topicEntry = widget.extra.topicEntry;
    id = topicEntry?.id ?? DateTime.now().millisecondsSinceEpoch;
    name = topicEntry?.name ?? '';
    description = topicEntry?.description ?? '';
    startDate = topicEntry?.startDate ?? DateTime.now();
    icon = topicEntry?.icon ??
        AssetIconDataEntity(
          assetPath: 'assets/icons/default.png',
          color: Colors.blue,
        );
    color = topicEntry?.color ?? Colors.blue;
    topicType = topicEntry?.topicType ?? TopicType.toggle;
    topicTypeSettings = topicEntry?.topicTypeSettings ??
        TopicTypeSettingsEntity(
          noteSettings: null,
          numberSettings: null,
          toggleSettings: TopicTypeToggleSettingsEntity(values: []),
        );
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final topicEntry = TopicEntryEntity(
        id: id,
        name: name,
        description: description,
        startDate: startDate,
        icon: icon,
        color: color,
        topicType: topicType,
        topicTypeSettings: topicTypeSettings,
      );
      context.pop(TopicEditorReturnData(topicEntry: topicEntry));
    }
  }

  void _delete() {
    context.pop(const TopicEditorReturnData(delete: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topic Editor'),
        actions: [
          TextButton(
            onPressed: _save,
            child: const Text('Save'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: name,
                decoration: const InputDecoration(labelText: 'Name'),
                onSaved: (value) => name = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a name' : null,
              ),
              TextFormField(
                initialValue: description,
                decoration: const InputDecoration(labelText: 'Description'),
                onSaved: (value) => description = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a description' : null,
              ),
              Row(
                children: [
                  const Text('Start Date'),
                  TextButton(
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: startDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (date != null) {
                        setState(() {
                          startDate = date;
                        });
                      }
                    },
                    child: Text(startDate.toString()),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Icon'),
                  // TODO Icon picker
                ],
              ),
              Row(
                children: [
                  const Text('Color'),
                  TextButton(
                    onPressed: () async {
                      final newColor = await showDialog<Color>(
                        context: context,
                        builder: (context) => ColorPicker(
                          onColorChanged: (Color newColor) {
                            setState(() {
                              color = newColor;
                            });
                          },
                        ),
                      );
                      if (newColor != null) {
                        setState(() {
                          color = newColor;
                        });
                      }
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      color: color,
                    ),
                  ),
                ],
              ),
              if (widget.extra.topicEntry != null)
                ElevatedButton(
                  onPressed: _delete,
                  child: const Text('Delete'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
