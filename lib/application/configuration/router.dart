import 'package:bitti/application/screens/journal_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const JournalScreen(),
    ),
  ],
);
