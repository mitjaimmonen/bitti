import 'package:bitti/application/screens/main_screen/bloc_journal/journal_bloc.dart';
import 'package:bitti/application/screens/main_screen/bloc_notes/notes_bloc.dart';
import 'package:bitti/application/screens/main_screen/bloc_settings/settings_bloc.dart';
import 'package:bitti/application/screens/main_screen/bloc_stats/stats_bloc.dart';
import 'package:bitti/application/screens/topics_screen/bloc_topics/topics_bloc.dart';
import 'package:bitti/data/data_sources/implementations/asset_icon_data_source.dart';
import 'package:bitti/data/data_sources/implementations/local_journal_data_source.dart';
import 'package:bitti/data/data_sources/implementations/local_topic_data_source.dart';
import 'package:bitti/data/data_sources/interfaces/icon_data_source.dart';
import 'package:bitti/data/data_sources/interfaces/journal_data_source.dart';
import 'package:bitti/data/data_sources/interfaces/topic_data_source.dart';
import 'package:bitti/data/repositories/icon_repository_impl.dart';
import 'package:bitti/data/repositories/journal_repository_impl.dart';
import 'package:bitti/data/repositories/topic_repository_impl.dart';
import 'package:bitti/domain/repositories/icon_repository.dart';
import 'package:bitti/domain/repositories/journal_repository.dart';
import 'package:bitti/domain/repositories/topic_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> injectDependencies() async {
  getIt.registerSingletonAsync<IconDataSource>(
    () async {
      final dataSource = AssetIconDataSource();
      dataSource.open();
      return dataSource;
    },
    dispose: (dataSource) => dataSource.close(),
  );

  getIt.registerSingletonAsync<JournalDataSource>(
    () async {
      final dataSource = LocalJournalDataSource();
      dataSource.open();
      return dataSource;
    },
    dispose: (dataSource) => dataSource.close(),
  );

  getIt.registerSingletonAsync<TopicDataSource>(
    () async {
      final dataSource = LocalTopicDataSource();
      dataSource.open();
      return dataSource;
    },
    dispose: (dataSource) => dataSource.close(),
  );

  getIt.registerSingletonAsync<IconRepository>(() async {
    final repository = IconRepositoryImpl(
      dataSource: await getIt.getAsync<IconDataSource>(),
    );
    return repository;
  });

  getIt.registerSingletonAsync<JournalRepository>(() async {
    final repository = JournalRepositoryImpl(
      dataSource: await getIt.getAsync<JournalDataSource>(),
    );
    return repository;
  });

  getIt.registerSingletonAsync<TopicRepository>(() async {
    final repository = TopicRepositoryImpl(
      dataSource: await getIt.getAsync<TopicDataSource>(),
    );
    return repository;
  });

  await getIt.allReady();
  getIt.registerFactory(
    () => JournalBloc(journalRepository: getIt(), topicRepository: getIt()),
  );
  getIt.registerFactory(() => NotesBloc());
  getIt.registerFactory(() => SettingsBloc());
  getIt.registerFactory(() => StatsBloc());
  getIt.registerFactory(() => TopicsBloc(topicRepository: getIt()));
}
