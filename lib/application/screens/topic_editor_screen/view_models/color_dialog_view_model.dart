import 'package:flutter/material.dart';

class ColorDialogExtraViewModel {
  final Color initialColor;

  const ColorDialogExtraViewModel({
    required this.initialColor,
  });
}

class ColorDialogReturnViewModel {
  final Color? color;

  const ColorDialogReturnViewModel({
    this.color,
  });
}
