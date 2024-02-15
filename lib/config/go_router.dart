import 'package:go_router/go_router.dart';
import 'package:task_manager/screens/home_screen.dart';

GoRouter router = GoRouter(routes: [
  GoRoute(
    path: "/",
    name: "home",
    builder: (context, state) => const HomeScreen(),
  )
]);
