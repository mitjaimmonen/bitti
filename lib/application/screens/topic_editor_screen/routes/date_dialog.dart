import 'package:bitti/application/models/screen_config_model.dart';
import 'package:bitti/application/screens/topic_editor_screen/entities/date_dialog_entities.dart';
import 'package:bitti/application/widget/dialog_widgets/sketch_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DateDialog extends StatelessWidget {
  final DateDialogExtraEntity extra;

  static const config = ScreenDialogConfigEntity(
    title: 'Date Dialog',
    routePath: '/date_dialog',
  );

  const DateDialog({
    super.key,
    required this.extra,
  });

  @override
  Widget build(BuildContext context) {
    var output = extra.initialDate;

    return SketchDialog(
      title: 'Select Date',
      children: [
        Material(
          child: DatePickerTheme(
            data: DatePickerThemeData(),
            child: CalendarDatePicker(
              initialDate: output,
              firstDate: DateTime(2000),
              lastDate: DateTime.now().add(const Duration(seconds: 1)),
              onDateChanged: (date) {
                output = date;
              },
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).pop(DateDialogReturnEntity(
              date: output,
            ));
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
