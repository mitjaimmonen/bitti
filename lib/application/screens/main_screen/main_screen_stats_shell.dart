import 'package:bitti/application/models/screen_config_model.dart';
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
