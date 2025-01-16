import 'package:bitti/domain/entities/screen_config_entity.dart';
import 'package:flutter/material.dart';

class MainScreenStatsShell extends StatelessWidget {
  const MainScreenStatsShell({super.key});

  static const config = ScreenShellConfigEntity(
    title: 'Stats',
    routePath: '/stats',
    icon: Icons.bar_chart,
  );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
