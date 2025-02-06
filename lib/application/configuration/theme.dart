import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.teal,
    brightness: Brightness.light,
  ),
  fontFamily: 'Delius',
  textTheme: TextTheme(
    headlineSmall: TextStyle(fontFamily: 'YuseiMagic'),
    headlineMedium: TextStyle(fontFamily: 'YuseiMagic'),
    headlineLarge: TextStyle(fontFamily: 'YuseiMagic'),
  ),
);

final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.teal,
    brightness: Brightness.dark,
  ),
  fontFamily: 'Delius',
  textTheme: TextTheme(
    headlineSmall: TextStyle(fontFamily: 'YuseiMagic'),
    headlineMedium: TextStyle(fontFamily: 'YuseiMagic'),
    headlineLarge: TextStyle(fontFamily: 'YuseiMagic'),
  ),
);
