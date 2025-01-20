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

class TopicEditorDialog extends StatelessWidget {
  final TopicEntryEntity? topicEntry;

  static const config = ScreenDialogConfigEntity(
    title: 'Topic Editor',
    routePath: '/topic-editor',
  );

  const TopicEditorDialog({
    super.key,
    this.topicEntry,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(config.title,
                style: Theme.of(context).textTheme.headlineMedium),
            TextField(),
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
