import 'package:bitti/application/screens/main_screen/bloc_journal/journal_bloc.dart';
import 'package:bitti/application/screens/main_screen/bloc_notes/notes_bloc.dart';
import 'package:bitti/application/screens/main_screen/bloc_settings/settings_bloc.dart';
import 'package:bitti/application/screens/main_screen/bloc_stats/stats_bloc.dart';
import 'package:bitti/domain/entities/screen_config_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
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
          title: Text(shellConfigs[shell.currentIndex].title),
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
        body: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: GetIt.I<JournalBloc>()),
            BlocProvider.value(value: GetIt.I<NotesBloc>()),
            BlocProvider.value(value: GetIt.I<SettingsBloc>()),
            BlocProvider.value(value: GetIt.I<StatsBloc>()),
          ],
          child: shell,
        ));
  }
}
