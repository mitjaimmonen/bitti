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
import 'package:bitti/domain/use_cases/journals/create_journal_use_case.dart';
import 'package:bitti/domain/use_cases/journals/delete_journal_use_case.dart';
import 'package:bitti/domain/use_cases/journals/read_journals_use_case.dart';
import 'package:bitti/domain/use_cases/journals/update_journal_use_case.dart';
import 'package:bitti/domain/use_cases/topics/create_topic_use_case.dart';
import 'package:bitti/domain/use_cases/topics/delete_topic_use_case.dart';
import 'package:bitti/domain/use_cases/topics/read_topics_use_case.dart';
import 'package:bitti/domain/use_cases/topics/update_topic_use_case.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> injectDependencies() async {
  getIt.registerSingletonAsync<IconDataSource>(() async {
    final dataSource = AssetIconDataSource();
    dataSource.open();
    return dataSource;
  }, dispose: (dataSource) => dataSource.close());

  getIt.registerSingletonAsync<JournalDataSource>(() async {
    final dataSource = LocalJournalDataSource();
    dataSource.open();
    return dataSource;
  }, dispose: (dataSource) => dataSource.close());

  getIt.registerSingletonAsync<TopicDataSource>(() async {
    final dataSource = LocalTopicDataSource();
    dataSource.open();
    return dataSource;
  }, dispose: (dataSource) => dataSource.close());

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

  getIt.registerSingletonAsync<CreateJournalUseCase>(() async {
    final useCase = CreateJournalUseCase(
      repository: await getIt.getAsync<JournalRepository>(),
    );
    return useCase;
  });

  getIt.registerSingletonAsync<ReadJournalsUseCase>(() async {
    final useCase = ReadJournalsUseCase(
      repository: await getIt.getAsync<JournalRepository>(),
    );
    return useCase;
  });

  getIt.registerSingletonAsync<UpdateJournalUseCase>(() async {
    final useCase = UpdateJournalUseCase(
      repository: await getIt.getAsync<JournalRepository>(),
    );
    return useCase;
  });

  getIt.registerSingletonAsync<DeleteJournalUseCase>(() async {
    final useCase = DeleteJournalUseCase(
      repository: await getIt.getAsync<JournalRepository>(),
    );
    return useCase;
  });

  getIt.registerSingletonAsync<CreateTopicUseCase>(() async {
    final useCase = CreateTopicUseCase(
      repository: await getIt.getAsync<TopicRepository>(),
    );
    return useCase;
  });

  getIt.registerSingletonAsync<ReadTopicsUseCase>(() async {
    final useCase = ReadTopicsUseCase(
      repository: await getIt.getAsync<TopicRepository>(),
    );
    return useCase;
  });

  getIt.registerSingletonAsync<UpdateTopicUseCase>(() async {
    final useCase = UpdateTopicUseCase(
      repository: await getIt.getAsync<TopicRepository>(),
    );
    return useCase;
  });

  getIt.registerSingletonAsync<DeleteTopicUseCase>(() async {
    final useCase = DeleteTopicUseCase(
      repository: await getIt.getAsync<TopicRepository>(),
    );
    return useCase;
  });

  await getIt.allReady();
  getIt.registerFactory(() => JournalBloc());
  getIt.registerFactory(() => NotesBloc());
  getIt.registerFactory(() => SettingsBloc());
  getIt.registerFactory(() => StatsBloc());
  getIt.registerFactory(() => TopicsBloc());
}
