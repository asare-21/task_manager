import 'package:go_router/go_router.dart';
import 'package:task_manager/models/task_parent_class.dart';
import 'package:task_manager/screens/create_task.dart';
import 'package:task_manager/screens/edit_task.dart';
import 'package:task_manager/screens/home_screen.dart';
import 'package:task_manager/screens/notifications_screen.dart';
import 'package:task_manager/screens/tasks_screen.dart';

GoRouter router = GoRouter(routes: [
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
