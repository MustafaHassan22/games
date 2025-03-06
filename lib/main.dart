import 'package:flutter/material.dart';
import 'package:games/core/utils/setup_service_locator.dart';
import 'package:games/games/presentation/views/game_view.dart';

void main() {
  initDependencies();
  runApp(const MyApp());
}

class GameRemoteDataSourceImpl {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GamesView(),
    );
  }
}
