import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/config/globals.dart';
import 'package:task_manager/config/go_router.dart';
import 'package:task_manager/provider/task_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Task Manager',
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        textTheme:
            GoogleFonts.openSansTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: grey1,
          displayColor: grey1,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: bgColor),
        appBarTheme: AppBarTheme(
            elevation: 0.5,
            color: bgColor,
            surfaceTintColor: bgColor,
            titleTextStyle: GoogleFonts.openSans().copyWith(
                color: grey1, fontWeight: FontWeight.bold, fontSize: 20),
            iconTheme: IconThemeData(color: grey1)),
        useMaterial3: true,
      ),
    );
  }
}
