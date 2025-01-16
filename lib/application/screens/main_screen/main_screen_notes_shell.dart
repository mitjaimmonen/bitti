import 'package:bitti/domain/entities/general/screen_config_entity.dart';
import 'package:flutter/material.dart';

class MainScreenNotesShell extends StatelessWidget {
  const MainScreenNotesShell({super.key});

  static const config = ScreenShellConfigEntity(
    title: 'Notes',
    routePath: '/notes',
    icon: Icons.note,
  );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
