import 'package:flutter/cupertino.dart';

class ScreenConfigModel {
  final String title;
  final String routePath;

  const ScreenConfigModel({
    required this.title,
    required this.routePath,
  });
}

class ScreenShellConfigEntity extends ScreenConfigModel {
  final IconData icon;

  const ScreenShellConfigEntity({
    required super.title,
    required super.routePath,
    required this.icon,
  });
}

class ScreenDialogConfigEntity extends ScreenConfigModel {
  const ScreenDialogConfigEntity({
    required super.title,
    required super.routePath,
  });
}
