import 'package:bitti/application/models/screen_config_model.dart';
import 'package:bitti/application/screens/topic_editor_screen/cubit/topic_editor_cubit.dart';
import 'package:bitti/application/screens/topic_editor_screen/view_models/topic_editor_view_model.dart';
import 'package:bitti/application/screens/topic_editor_screen/widgets/topic_editor_loaded_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TopicEditorScreen extends StatefulWidget {
  final TopicEditorExtraViewModel extra;

  static const config = RouteConfigModel(
    title: 'Topic Editor',
    routePath: '/topic-editor',
  );

  const TopicEditorScreen({
    super.key,
    required this.extra,
  });

  @override
  TopicEditorScreenState createState() => TopicEditorScreenState();
}

class TopicEditorScreenState extends State<TopicEditorScreen> {
  final _formKey = GlobalKey<FormState>();

  void _save(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final cubit = context.read<TopicEditorCubit>();
      final state = cubit.state as TopicEditorLoaded;
      context.pop(TopicEditorReturnViewModel(topicEntry: state.topicEntry));
    }
  }

  void _delete() {
    context.pop(const TopicEditorReturnViewModel(delete: true));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopicEditorCubit()
        ..init(
          widget.extra.topicEntry,
        ),
      child: BlocBuilder<TopicEditorCubit, TopicEditorState>(
        buildWhen: (previous, current) {
          return previous.runtimeType != current.runtimeType;
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Topic Editor'),
              actions: [
                TextButton(
                  onPressed: () => _save(context),
                  child: const Text('Save'),
                ),
              ],
            ),
            body: Builder(
              builder: (context) {
                if (state is! TopicEditorLoaded) {
                  return const SizedBox();
                }
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: TopicEditorLoadedView(
                        onDelete: widget.extra.topicEntry != null
                            ? () => _delete()
                            : null,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
