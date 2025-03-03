import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  final GoRouterState state;
  final String homePath;

  const ErrorScreen({
    super.key,
    required this.state,
    required this.homePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Page not found: ${state.uri}'),
            ElevatedButton(
              onPressed: () {
                context.go(homePath);
              },
              child: Text('Return Home'),
            ),
          ],
        ),
      ),
    );
  }
}
