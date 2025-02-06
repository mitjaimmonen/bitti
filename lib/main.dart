import 'package:bitti/application/configuration/injection.dart';
import 'package:bitti/application/configuration/router.dart';
import 'package:bitti/application/configuration/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injectDependencies();
  initializeDateFormatting();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fi'),
        Locale('en'),
      ],
      theme: theme,
      darkTheme: darkTheme,
      routerConfig: router,
    );
  }
}
