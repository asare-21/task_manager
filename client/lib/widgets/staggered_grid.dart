import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:protos/protos.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/config/globals.dart';
import 'package:task_manager/provider/gRPC_provider.dart';
import 'package:task_manager/provider/task_provider.dart';

class StaggeredGridViewF extends StatelessWidget {
  const StaggeredGridViewF({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<GRPCProvider>().getTaskParentList(User(id: "sd")),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Consumer<GRPCProvider>(
                builder: (context, taskProvider, child) => GridView.custom(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverWovenGridDelegate.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    tileBottomSpace: 10,
                    pattern: [
                      const WovenGridTile(1),
                      const WovenGridTile(
                        1,
                        crossAxisRatio: 0.8,
                        alignment: AlignmentDirectional.centerEnd,
                      ),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    childCount: taskProvider.taskParents.length <= 8
                        ? taskProvider.taskParents.length
                        : 8,
                    (context, index) => Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1,
                                  color: bgColor1.withOpacity(0.5),
                                  blurStyle: BlurStyle.outer,
                                  spreadRadius: 2)
                            ],
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  bgColor,
                                  bgColor1,
                                ]),
                            color: const Color(0xff3f37c9),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: IconButton.filled(
                                    iconSize: 20,
                                    style: IconButton.styleFrom(
                                        backgroundColor: grey),
                                    onPressed: () {
                                      //
                                      context.pushNamed("edit_task",
                                          extra:
                                              taskProvider.taskParents[index]);
                                    },
                                    icon: const Icon(Icons.edit)),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                taskProvider.taskParents[index].title,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "${taskProvider.taskParents[index].tasks.length} tasks",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            const Gap(5),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    "Due: ${taskProvider.taskParents[index].date}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                              ),
                            ),
                            if (index != 2 && index != 1)
                              Column(
                                children: [
                                  const Gap(20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: LinearProgressIndicator(
                                      borderRadius: BorderRadius.circular(30),
                                      value: taskProvider
                                          .getSingleTaskParentProgress(
                                              taskProvider
                                                  .taskParents[index].title),
                                      backgroundColor: bgColor,
                                      color: green,
                                    ),
                                  ),
                                ],
                              )
                          ],
                        )),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
