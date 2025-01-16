import 'package:bitti/domain/entities/general/screen_config_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
