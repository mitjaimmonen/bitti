import 'package:bitti/application/screens/main_screen/bloc_journal/journal_bloc.dart';
import 'package:bitti/application/screens/main_screen/bloc_notes/notes_bloc.dart';
import 'package:bitti/application/screens/main_screen/bloc_settings/settings_bloc.dart';
import 'package:bitti/application/screens/main_screen/bloc_stats/stats_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> injectDependencies() async {
  getIt.registerFactory<JournalBloc>(() => JournalBloc());
  getIt.registerFactory<NotesBloc>(() => NotesBloc());
  getIt.registerFactory<SettingsBloc>(() => SettingsBloc());
  getIt.registerFactory<StatsBloc>(() => StatsBloc());
}
