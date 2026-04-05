import 'package:bitti/application/models/screen_config_model.dart';
import 'package:bitti/application/screens/topic_editor_screen/topic_editor_screen.dart';
import 'package:bitti/application/screens/topic_editor_screen/view_models/topic_editor_view_model.dart';
import 'package:bitti/application/screens/topics_screen/bloc_topics/topics_bloc.dart';
import 'package:bitti/application/widget/buttons/sketch_button_headline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  static const config = RouteConfigModel(
    title: 'Topics',
    routePath: '/topics',
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<TopicsBloc>()..add(LoadTopicsEvent()),
      child: BlocBuilder<TopicsBloc, TopicsState>(
        builder: (context, state) {
          switch (state) {
            case TopicsInitial():
            case TopicsLoading():
              return Center(
                child: CircularProgressIndicator(),
              );
            case TopicsErrored():
              return Center(
                child: Text('Something went wrong'),
              );
            case TopicsLoaded():
              if (state.topics?.isEmpty ?? true) {
                return _buildNoTopicsView(context);
              } else {
                return _buildTopicsListView(context, state);
              }
          }
        },
      ),
    );
  }

  Widget _buildNoTopicsView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(config.title),
      ),
      body: Center(
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
              onPressed: () => _editTopic(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopicsListView(BuildContext context, TopicsLoaded state) {
    return Scaffold(
      appBar: AppBar(
        title: Text(config.title),
        actions: [
          TextButton(
            onPressed: () {
              _editTopic(context);
            },
            child: Text('Add topic'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: state.topics?.length ?? 0,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(state.topics![index].name),
            trailing: IconButton(
              onPressed: () {
                _editTopic(
                  context,
                  extra: TopicEditorExtraViewModel(
                    topicEntry: state.topics![index],
                  ),
                );
              },
              icon: Icon(Icons.edit),
            ),
          );
        },
      ),
    );
  }

  Future<void> _editTopic(
    BuildContext context, {
    TopicEditorExtraViewModel extra = const TopicEditorExtraViewModel(),
  }) async {
    final data = await context.push<TopicEditorReturnViewModel>(
      TopicEditorScreen.config.routePath,
      extra: extra,
    );

    if (!context.mounted) return;

    if (data?.topicEntry != null) {
      final bloc = context.read<TopicsBloc>();
      bloc.add(AddTopicEvent(topic: data!.topicEntry!));
    }
  }
}
