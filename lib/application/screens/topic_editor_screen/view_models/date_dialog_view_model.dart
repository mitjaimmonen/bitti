class DateDialogExtraViewModel {
  final DateTime initialDate;

  const DateDialogExtraViewModel({
    required this.initialDate,
  });
}

class DateDialogReturnViewModel {
  final DateTime? date;

  const DateDialogReturnViewModel({
    this.date,
  });
}
