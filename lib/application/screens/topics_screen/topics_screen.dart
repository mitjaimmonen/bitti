import 'package:bitti/application/screens/topic_editor_screen/topic_editor_screen.dart';
import 'package:bitti/application/screens/topics_screen/bloc_topics/topics_bloc.dart';
import 'package:bitti/domain/entities/general/screen_config_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  static const config = ScreenConfigEntity(
    title: 'Topics',
    routePath: '/topics',
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<TopicsBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(config.title),
        ),
        body: BlocBuilder<TopicsBloc, TopicsState>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Topics screen'),
                  ElevatedButton(
                    onPressed: () async {
                      final data = await context.push(
                        TopicEditorScreen.config.routePath,
                        extra: const TopicEditorExtraData(),
                      );
                    },
                    child: const Text('Add Topic'),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
