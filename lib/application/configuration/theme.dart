import 'package:flutter/material.dart';

class SketchColorExtension extends ThemeExtension<SketchColorExtension> {
  final Color blue;
  final Color blueAccent;
  final Color red;
  final Color redAccent;
  final Color yellow;
  final Color yellowAccent;
  final Color green;
  final Color greenAccent;
  final Color purple;
  final Color purpleAccent;
  final Color orange;
  final Color orangeAccent;

  const SketchColorExtension({
    this.blue = const Color(0xFF46A3F3),
    this.blueAccent = const Color(0xFF60ADC8),
    this.red = const Color(0xFFEA4D4D),
    this.redAccent = const Color(0xFFC37070),
    this.yellow = const Color(0xFFE8E843),
    this.yellowAccent = const Color(0xFFD6D68A),
    this.green = const Color(0xFF4DDD4D),
    this.greenAccent = const Color(0xFF5CBD5C),
    this.purple = const Color(0xFFC844C8),
    this.purpleAccent = const Color(0xFFB881B8),
    this.orange = const Color(0xFFDAA748),
    this.orangeAccent = const Color(0xFFB8A37E),
  });

  List<Color> get colors => <Color>[
        blue,
        blueAccent,
        red,
        redAccent,
        yellow,
        yellowAccent,
        green,
        greenAccent,
        purple,
        purpleAccent,
        orange,
        orangeAccent,
      ];

  @override
  ThemeExtension<SketchColorExtension> copyWith({
    Color? blue,
    Color? blueAccent,
    Color? red,
    Color? redAccent,
    Color? yellow,
    Color? yellowAccent,
    Color? green,
    Color? greenAccent,
    Color? purple,
    Color? purpleAccent,
    Color? orange,
    Color? orangeAccent,
  }) {
    return SketchColorExtension(
      blue: blue ?? this.blue,
      blueAccent: blueAccent ?? this.blueAccent,
      red: red ?? this.red,
      redAccent: redAccent ?? this.redAccent,
      yellow: yellow ?? this.yellow,
      yellowAccent: yellowAccent ?? this.yellowAccent,
      green: green ?? this.green,
      greenAccent: greenAccent ?? this.greenAccent,
      purple: purple ?? this.purple,
      purpleAccent: purpleAccent ?? this.purpleAccent,
      orange: orange ?? this.orange,
      orangeAccent: orangeAccent ?? this.orangeAccent,
    );
  }

  @override
  ThemeExtension<SketchColorExtension> lerp(
      covariant ThemeExtension<SketchColorExtension>? other, double t) {
    if (other is! SketchColorExtension) {
      return this;
    }

    return SketchColorExtension(
      blue: Color.lerp(blue, other.blue, t)!,
      blueAccent: Color.lerp(blueAccent, other.blueAccent, t)!,
      red: Color.lerp(red, other.red, t)!,
      redAccent: Color.lerp(redAccent, other.redAccent, t)!,
      yellow: Color.lerp(yellow, other.yellow, t)!,
      yellowAccent: Color.lerp(yellowAccent, other.yellowAccent, t)!,
      green: Color.lerp(green, other.green, t)!,
      greenAccent: Color.lerp(greenAccent, other.greenAccent, t)!,
      purple: Color.lerp(purple, other.purple, t)!,
      purpleAccent: Color.lerp(purpleAccent, other.purpleAccent, t)!,
      orange: Color.lerp(orange, other.orange, t)!,
      orangeAccent: Color.lerp(orangeAccent, other.orangeAccent, t)!,
    );
  }
}

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
  extensions: const <ThemeExtension>[
    SketchColorExtension(
      blue: Color(0xFF73BDFA),
      blueAccent: Color(0xFF91BED6),
      red: Color(0xFFF87171),
      redAccent: Color(0xFFE18B8B),
      yellow: Color(0xFFCFCF00),
      yellowAccent: Color(0xFFC8C864),
      green: Color(0xFF55D155),
      greenAccent: Color(0xFF8DD58D),
      purple: Color(0xFFEC74EC),
      purpleAccent: Color(0xFFE1ACE1),
      orange: Color(0xFFDA9B48),
      orangeAccent: Color(0xFFCFB78B),
    ),
  ],
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
  extensions: const <ThemeExtension>[
    SketchColorExtension(
      blue: Color(0xFF296CA2),
      blueAccent: Color(0xFF355D72),
      red: Color(0xFF791A1A),
      redAccent: Color(0xFF863E3E),
      yellow: Color(0xFF8D8D0B),
      yellowAccent: Color(0xFF818137),
      green: Color(0xFF197C19),
      greenAccent: Color(0xFF3B673B),
      purple: Color(0xFF862986),
      purpleAccent: Color(0xFF804C80),
      orange: Color(0xFF804D08),
      orangeAccent: Color(0xFF6E5932),
    ),
  ],
);
