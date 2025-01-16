import 'package:bitti/application/screens/main_screen/main_screen.dart';
import 'package:bitti/application/screens/main_screen/main_screen_journal_shell.dart';
import 'package:bitti/application/screens/main_screen/main_screen_notes_shell.dart';
import 'package:bitti/application/screens/main_screen/main_screen_settings_shell.dart';
import 'package:bitti/application/screens/main_screen/main_screen_stats_shell.dart';
import 'package:bitti/domain/entities/general/screen_config_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final List<ScreenShellConfigEntity> _shellConfigs = [
  MainScreenJournalShell.config,
  MainScreenNotesShell.config,
  MainScreenStatsShell.config,
  MainScreenSettingsShell.config,
];

final List<StatefulShellBranch> _shellBranches = [
  StatefulShellBranch(
    routes: [
      GoRoute(
        path: MainScreenJournalShell.config.routePath,
        name: MainScreenJournalShell.config.title,
        builder: (context, state) => const MainScreenJournalShell(),
      ),
    ],
  ),
  StatefulShellBranch(
    routes: [
      GoRoute(
        path: MainScreenNotesShell.config.routePath,
        name: MainScreenNotesShell.config.title,
        builder: (context, state) => const MainScreenNotesShell(),
      ),
    ],
  ),
  StatefulShellBranch(
    routes: [
      GoRoute(
        path: MainScreenStatsShell.config.routePath,
        name: MainScreenStatsShell.config.title,
        builder: (context, state) => const MainScreenStatsShell(),
      ),
    ],
  ),
  StatefulShellBranch(
    routes: [
      GoRoute(
        path: MainScreenSettingsShell.config.routePath,
        name: MainScreenSettingsShell.config.title,
        builder: (context, state) => const MainScreenSettingsShell(),
      ),
    ],
  ),
];

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: _shellConfigs.first.routePath,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(
          shell: navigationShell,
          shellConfigs: _shellConfigs,
        );
      },
      branches: _shellBranches,
    ),
  ],
);
