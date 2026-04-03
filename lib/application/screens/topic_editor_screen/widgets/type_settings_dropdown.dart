import 'package:bitti/application/widget/buttons/sketch_button_icon.dart';
import 'package:bitti/application/widget/inputs/sketch_dropdown.dart';
import 'package:bitti/domain/enums/topic_type.dart';
import 'package:flutter/material.dart';

class TypeSettingsDropdown extends StatelessWidget {
  final TopicType value;
  final EdgeInsets? padding;
  final void Function(TopicType?) onChanged;
  final void Function(TopicType?) onOpenSettings;

  const TypeSettingsDropdown({
    required this.value,
    required this.padding,
    required this.onChanged,
    required this.onOpenSettings,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
            child: SketchDropdown<TopicType>(
              title: 'Type',
              value: value,
              items: [
                DropdownMenuItem(
                  value: TopicType.toggle,
                  child: Text('Toggle'),
                ),
                DropdownMenuItem(
                  value: TopicType.number,
                  child: Text('Number'),
                ),
                DropdownMenuItem(
                  value: TopicType.note,
                  child: Text('Note'),
                ),
              ],
              onChanged: onChanged,
            ),
          ),
          SketchButtonIcon(
            onPressed: () => onOpenSettings(value),
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }
}
