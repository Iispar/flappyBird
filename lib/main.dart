import 'package:flappy_bird/features/start/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


Future<void> main() async {
  runApp(GameApp());
}

class GameApp extends StatelessWidget {
  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: StartScreen(),
    );
  }
}