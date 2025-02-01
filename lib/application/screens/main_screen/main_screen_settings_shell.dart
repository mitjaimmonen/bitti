import 'package:bitti/application/models/screen_config_model.dart';
import 'package:flutter/material.dart';

class MainScreenSettingsShell extends StatelessWidget {
  const MainScreenSettingsShell({super.key});

  static const config = ScreenShellConfigEntity(
    title: 'Settings',
    routePath: '/settings',
    icon: Icons.settings,
  );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
