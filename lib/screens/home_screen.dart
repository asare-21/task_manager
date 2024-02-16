import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:task_manager/config/globals.dart';
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
              onPressed: () {},
              icon: Icon(
                Icons.notifications_rounded,
                color: grey1,
              )),
          const Gap(15)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          children: [
            ListTile(
              title: Text(
                "Hi, Joseph",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
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
            const SearchWidget(),
            const Gap(5),
            const TaskProgress(),
            const Gap(10),
            const StaggeredGridViewF()
          ],
        ),
      ),
    );
  }
}
