import 'package:go_router/go_router.dart';
import 'package:protos/protos.dart';
import 'package:task_manager/provider/authentication_provider.dart';
import 'package:task_manager/screens/create_task.dart';
import 'package:task_manager/screens/edit_task.dart';
import 'package:task_manager/screens/home_screen.dart';
import 'package:task_manager/screens/login.dart';
import 'package:task_manager/screens/notifications_screen.dart';
import 'package:task_manager/screens/tasks_screen.dart';

GoRouter router = GoRouter(
    redirect: (context, state) async {
      bool response = await AuthenticationProvider().isAuthenticated();
      if (response && state.fullPath == "/") {
        return "/";
      }
      

      return null;
    },
    initialLocation: "/",
    routes: [
      GoRoute(
          path: "/auth",
          name: "auth",
          builder: (context, state) {
            return const LoginScreen();
          }),
      GoRoute(
        path: "/",
        name: "home",
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
          path: "/notifications",
          name: "notifications",
          builder: (context, state) {
            return const NotificationsScreen();
          }),
      GoRoute(
        path: "/tasks",
        name: "tasks",
        builder: (context, state) => const TaskScreen(),
      ),
      GoRoute(
        path: "/create-task",
        name: "create_task",
        builder: (context, state) => const CreateTaskScreen(),
      ),
      GoRoute(
        path: "/edit-task",
        name: "edit_task",
        builder: (context, state) {
          // Extract taskParent from parameters
          final taskParent = state.extra as TaskParentModel;
          return EditTaskScreen(taskParent: taskParent);
        },
      ),
    ]);
