import 'package:bitti/domain/entities/general/screen_config_entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_entry_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopicDialogReturnData {
  final TopicEntryEntity? topicEntry;
  final bool delete;

  const TopicDialogReturnData({
    this.topicEntry,
    this.delete = false,
  });
}

class TopicEditorScreen extends StatelessWidget {
  final TopicEntryEntity? topicEntry;

  static const config = ScreenConfigEntity(
    title: 'Topic Editor',
    routePath: '/topic-editor',
  );

  const TopicEditorScreen({
    super.key,
    this.topicEntry,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Save'),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.pop(const TopicDialogReturnData(delete: true));
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
