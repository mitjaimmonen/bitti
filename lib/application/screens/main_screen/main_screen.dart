import 'package:bitti/domain/entities/screen_config_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
    required this.shell,
    required this.shellConfigs,
  });

  final StatefulNavigationShell shell;
  final List<ScreenShellConfigEntity> shellConfigs;

  void _onItemTapped(int index) {
    shell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bitti'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: shell.currentIndex,
        onTap: _onItemTapped,
        items: shellConfigs
            .map(
              (config) => BottomNavigationBarItem(
                icon: Icon(config.icon),
                label: config.title,
              ),
            )
            .toList(),
      ),
      body: shell,
    );
  }
}
