import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:unsplash_flutter/features/image_list/presentation/bloc/image_list_cubit.dart';
import 'package:unsplash_flutter/features/image_list/presentation/screen/image_list_screen.dart';
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
    builder: (context, state) => BlocProvider(
      create: (context) => ImageListCubit(
        downloadImageUseCase: sl(),
        getImageListUseCase: sl(),
      ),
      child: const ImageListScreen(),
    ),
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
