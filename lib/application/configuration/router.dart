import 'package:bitti/application/models/screen_config_model.dart';
import 'package:bitti/application/screens/error_screen/error_screen.dart';
import 'package:bitti/application/screens/main_screen/main_screen.dart';
import 'package:bitti/application/screens/main_screen/main_screen_journal_shell.dart';
import 'package:bitti/application/screens/main_screen/main_screen_notes_shell.dart';
import 'package:bitti/application/screens/main_screen/main_screen_settings_shell.dart';
import 'package:bitti/application/screens/main_screen/main_screen_stats_shell.dart';
import 'package:bitti/application/screens/topic_editor_screen/entities/date_dialog_entities.dart';
import 'package:bitti/application/screens/topic_editor_screen/entities/toggle_settings_dialog_entities.dart';
import 'package:bitti/application/screens/topic_editor_screen/entities/topic_editor_extra_entity.dart';
import 'package:bitti/application/screens/topic_editor_screen/routes/date_dialog.dart';
import 'package:bitti/application/screens/topic_editor_screen/routes/toggle_settings_dialog.dart';
import 'package:bitti/application/screens/topic_editor_screen/topic_editor_screen.dart';
import 'package:bitti/application/screens/topics_screen/topics_screen.dart';
import 'package:bitti/application/widget/dialog_widgets/dialog_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final List<ShellConfigModel> _mainScreenShellConfigs = [
  MainScreenJournalShell.config,
  MainScreenNotesShell.config,
  MainScreenStatsShell.config,
  MainScreenSettingsShell.config,
];

final List<StatefulShellBranch> _mainScreenShellBranches = [
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
  initialLocation: _mainScreenShellConfigs.first.routePath,
  errorBuilder: (context, state) => ErrorScreen(
    state: state,
    homePath: _mainScreenShellConfigs.first.routePath,
  ),
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(
          shell: navigationShell,
          shellConfigs: _mainScreenShellConfigs,
        );
      },
      branches: _mainScreenShellBranches,
    ),
    GoRoute(
      path: TopicsScreen.config.routePath,
      name: TopicsScreen.config.title,
      builder: (context, state) => const TopicsScreen(),
    ),
    GoRoute(
        path: TopicEditorScreen.config.routePath,
        name: TopicEditorScreen.config.title,
        builder: (context, state) {
          final extra = state.extra as TopicEditorExtraEntity;
          return TopicEditorScreen(extra: extra);
        },
        routes: [
          GoRoute(
            path: ToggleSettingsDialog.config.relativePath,
            name: ToggleSettingsDialog.config.title,
            pageBuilder: (BuildContext context, GoRouterState state) {
              final extra = state.extra as ToggleSettingsDialogExtraEntity;
              return DialogPage(
                barrierColor: Colors.transparent,
                useSafeArea: false,
                barrierDismissible: false,
                builder: (_) => ToggleSettingsDialog(extra: extra),
              );
            },
          ),
        ]),
    GoRoute(
      path: DateDialog.config.routePath,
      name: DateDialog.config.title,
      pageBuilder: (BuildContext context, GoRouterState state) {
        final extra = state.extra as DateDialogExtraEntity;
        return DialogPage(
          builder: (_) => DateDialog(extra: extra),
        );
      },
    ),
  ],
);
