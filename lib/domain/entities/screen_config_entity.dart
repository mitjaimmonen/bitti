import 'package:bitti/domain/entities/entity.dart';
import 'package:flutter/cupertino.dart';

class ScreenConfigEntity extends Entity {
  final String title;
  final String routePath;

  const ScreenConfigEntity({
    required this.title,
    required this.routePath,
  });
}

class ScreenShellConfigEntity extends ScreenConfigEntity {
  final IconData icon;

  const ScreenShellConfigEntity({
    required super.title,
    required super.routePath,
    required this.icon,
  });
}
