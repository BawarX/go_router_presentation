import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const MyApp());

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailsScreen();
          },
        ),
        GoRoute(
          path: 'modal',
          builder: (BuildContext context, GoRouterState state) {
            return const ModalScreen();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

/// The home screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/details'),
              child: const Text('Go to the Details screen'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () => context.push('/details'),
              child: const Text('push to the Details screen'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () => context.go('/modal'),
              child: const Text('Go to the Details screen'),
            ),
          ],
        ),
      ),
    );
  }
}

/// The details screen
class DetailsScreen extends StatelessWidget {
  /// Constructs a [DetailsScreen]
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title: const Text('Details Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/modal'),
              child: const Text('Go to modal screen'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/modal'),
              child: const Text('push to modal screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class ModalScreen extends StatelessWidget {
  const ModalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(title: const Text('Modal Screen')),
      body: const Center(),
    );
  }
}
