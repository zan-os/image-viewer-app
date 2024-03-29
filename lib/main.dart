import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:unsplash_flutter/features/image_list/presentation/screen/home_screen.dart';
import 'package:unsplash_flutter/registered_injection.dart';

void main() async {
  // Load .env file
  await dotenv.load(fileName: ".env");

  await RegisteredInjection.init();

  runApp(const MainApp());
}

final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  )
]);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
