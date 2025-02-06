import 'package:bitti/application/models/screen_config_model.dart';
import 'package:bitti/application/screens/topic_editor_screen/topic_editor_screen.dart';
import 'package:bitti/application/screens/topics_screen/bloc_topics/topics_bloc.dart';
import 'package:bitti/application/widget/buttons/sketch_button_headline.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  static const config = ScreenConfigModel(
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
                  Text(
                    'No topics found',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 32.0),
                  SketchButtonHeadline(
                    text: 'Add Topic',
                    onPressed: () async {
                      final data = await context.push(
                        TopicEditorScreen.config.routePath,
                        extra: const TopicEditorExtraData(),
                      );
                      if (kDebugMode) print(data);
                    },
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
