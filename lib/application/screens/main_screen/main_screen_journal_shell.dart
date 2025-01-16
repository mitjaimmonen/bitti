import 'package:bitti/domain/entities/screen_config_entity.dart';
import 'package:flutter/material.dart';

class MainScreenJournalShell extends StatelessWidget {
  const MainScreenJournalShell({super.key});

  static const config = ScreenShellConfigEntity(
    title: 'Journal',
    routePath: '/journal',
    icon: Icons.book,
  );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
