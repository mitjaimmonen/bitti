import 'package:flutter/cupertino.dart';

class RouteConfigModel {
  final String title;
  final String routePath;

  const RouteConfigModel({
    required this.title,
    required this.routePath,
  });
}

class ShellConfigModel extends RouteConfigModel {
  final IconData icon;

  const ShellConfigModel({
    required super.title,
    required super.routePath,
    required this.icon,
  });
}

class DialogConfigModel extends RouteConfigModel {
  const DialogConfigModel({
    required super.title,
    required super.routePath,
  });
}

class SubRouteConfigModel extends RouteConfigModel {
  final String relativePath;

  const SubRouteConfigModel({
    required super.title,
    required super.routePath,
    required this.relativePath,
  });
}
