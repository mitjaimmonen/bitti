import 'package:bitti/domain/entities/screen_config_entity.dart';
import 'package:flutter/material.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

class MainScreenJournalShell extends StatelessWidget {
  const MainScreenJournalShell({super.key});

  static const config = ScreenShellConfigEntity(
    title: 'Journal',
    routePath: '/journal',
    icon: Icons.book,
  );

  @override
  Widget build(BuildContext context) {
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
  }
}
