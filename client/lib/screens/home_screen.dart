import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/config/globals.dart';
import 'package:task_manager/provider/task_provider.dart';
import 'package:task_manager/widgets/no_task_parent.dart';
import 'package:task_manager/widgets/search_widget.dart';
import 'package:task_manager/widgets/staggered_grid.dart';
import 'package:task_manager/widgets/task_progress.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                // TODO: Implement notification and show notifications screen
                context.pushNamed("notifications");
              },
              icon: Icon(
                Icons.notifications_rounded,
                color: grey1,
              )),
          const Gap(15)
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        children: [
          ListTile(
            title: Text(
              "Hi, Joseph",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: grey1),
            ),
            subtitle: Text(
              "Be productive today!",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: grey1, fontWeight: FontWeight.bold),
            ),
          ),
          const Gap(5),
          Consumer<TaskProvider>(
              builder: (context, value, child) => value.taskParents.isEmpty
                  ? Container()
                  : const SearchWidget()),
          const Gap(5),
          Consumer<TaskProvider>(
              builder: (context, value, child) => value.taskParents.isEmpty
                  ? const NoTaskParent()
                  : const TaskProgress()),
          const Gap(20),
          const StaggeredGridViewF()
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 10,
              backgroundColor: const Color(0xff3f37c9),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () => context.pushNamed("create_task"),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add new task",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const Gap(10),
                const Icon(Icons.add, color: Colors.white, size: 20)
              ],
            )),
      ),
    );
  }
}
