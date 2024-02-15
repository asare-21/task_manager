import 'package:flutter/material.dart';
import 'package:task_manager/config/globals.dart';
import 'package:task_manager/config/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Task Manager',
      theme: ThemeData(
        fontFamily: "open-sans",
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.fromSeed(seedColor: bgColor),
        cardColor: grey,
        appBarTheme: AppBarTheme(elevation: 0.5, color: bgColor),
        useMaterial3: true,
      ),
    );
  }
}