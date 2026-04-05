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

  static const config = ShellConfigModel(
    title: 'Journal',
    routePath: '/journal',
    icon: Icons.book,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(config.title),
        actions: [
          TextButton(
            onPressed: () {
              GoRouter.of(context).push(TopicsScreen.config.routePath);
            },
            child: Text('Edit topics'),
          ),
        ],
      ),
      body: BlocBuilder<JournalBloc, JournalState>(
        builder: (context, state) {
          switch (state) {
            case JournalInitial():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case JournalLoaded():
              if (state.journalMap.isEmpty) {
                return _buildNoJournalsView(context);
              } else {
                return _buildJournalsGridView(context, state);
              }
            case JournalErrored():
              return const Center(
                child: Text('Loading journals failed'),
              );
          }
        },
      ),
    );
  }

  Widget _buildNoJournalsView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No journals found',
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

  Widget _buildJournalsGridView(BuildContext context, JournalLoaded state) {
    final topicCount = state.journalMap.keys.length;

    return TableView.builder(
      diagonalDragBehavior: DiagonalDragBehavior.weightedContinuous,
      pinnedColumnCount: 1,
      pinnedRowCount: 1,
      verticalDetails: ScrollableDetails.vertical(
        reverse: true,
      ),
      columnBuilder: (int index) {
        if (index >= topicCount) return null;

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
        if (vicinity.row == 0 && vicinity.column == 0) {
          return TableViewCell(child: SizedBox.shrink());
        }
        if (vicinity.row == 0) {
          // build header row
          return TableViewCell(
            child: Text('TOPIC ${vicinity.column - 1}'),
          );
        }
        if (vicinity.column == 0) {
          // build dates
          return TableViewCell(
            child: Text('DATE ${vicinity.row - 1}'),
          );
        }

        return TableViewCell(
          child: Text('Cell ${vicinity.row}, ${vicinity.column}'),
        );
      },
    );
  }
}
