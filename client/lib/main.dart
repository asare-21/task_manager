import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/config/globals.dart';
import 'package:task_manager/config/go_router.dart';
import 'package:task_manager/provider/authentication_provider.dart';
import 'package:task_manager/provider/gRPC_provider.dart';
import 'package:task_manager/provider/task_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// SCHEME://dev-ew2mgn7vvmi1sfiu.us.auth0.com/android/com.io.taskManager/callback
// com.io.taskManager://dev-ew2mgn7vvmi1sfiu.us.auth0.com/ios/com.io.taskManager/callback
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => GRPCProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AuthenticationProvider(),
    )
  ], child: const MyApp()));
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]); // sent device orientation
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
