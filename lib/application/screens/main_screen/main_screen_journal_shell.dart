import 'package:bitti/application/models/screen_config_model.dart';
import 'package:bitti/application/screens/topics_screen/topics_screen.dart';
import 'package:bitti/application/widget/buttons/sketch_button_headline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

import 'bloc_journal/journal_bloc.dart';

class MainScreenJournalShell extends StatelessWidget {
  const MainScreenJournalShell({super.key});

  static const config = ScreenShellConfigEntity(
    title: 'Journal',
    routePath: '/journal',
    icon: Icons.book,
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JournalBloc, JournalState>(
      builder: (context, state) {
        if (state is! JournalLoaded) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final topicCount = state.topicList.topics.length;

        if (topicCount == 0) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No topics found',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 32.0),
                SketchButtonHeadline(
                  text: 'Edit topics',
                  onPressed: () {
                    GoRouter.of(context).push(TopicsScreen.config.routePath);
                  },
                ),
              ],
            ),
          );
        }

        return TableView.builder(
          diagonalDragBehavior: DiagonalDragBehavior.weightedContinuous,
          pinnedColumnCount: 1,
          pinnedRowCount: 1,
          columnBuilder: (int index) {
            return const TableSpan(
              extent: FixedSpanExtent(100.0),
            );
          },
          rowBuilder: (int index) {
            return const TableSpan(
              extent: FixedSpanExtent(100.0),
            );
          },
          cellBuilder: (BuildContext context, TableVicinity vicinity) {
            return TableViewCell(
              child: Text('Cell ${vicinity.row}, ${vicinity.column}'),
            );
          },
        );
      },
    );
  }
}
