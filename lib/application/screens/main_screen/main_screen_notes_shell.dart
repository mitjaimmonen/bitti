import 'package:bitti/application/models/screen_config_model.dart';
import 'package:flutter/material.dart';

class MainScreenNotesShell extends StatelessWidget {
  const MainScreenNotesShell({super.key});

  static const config = ShellConfigModel(
    title: 'Notes',
    routePath: '/notes',
    icon: Icons.note,
  );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
