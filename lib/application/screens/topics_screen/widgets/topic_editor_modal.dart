import 'package:bitti/domain/entities/general/topic_entities/topic_entry_entity.dart';
import 'package:flutter/material.dart';

class TopicEditorModal extends StatelessWidget {
  final TopicEntryEntity? topicEntry;
  final Function(TopicEntryEntity) onTopicEntryUpdated;
  final Function() onTopicEntryDeleted;
  final Function() onDismiss;

  const TopicEditorModal({
    super.key,
    required this.onTopicEntryUpdated,
    required this.onTopicEntryDeleted,
    required this.onDismiss,
    this.topicEntry,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Theme.of(context).shadowColor.withAlpha(100),
        ),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 16.0),
                  const Text(
                    'Topic editor',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Divider(),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Close'),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            )),
      ],
    );
  }
}
