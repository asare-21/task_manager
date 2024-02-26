import 'package:flutter/material.dart';
import 'package:protos/protos.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/config/globals.dart';
import 'package:task_manager/provider/gRPC_provider.dart';

class TaskProgress extends StatelessWidget {
  const TaskProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: context.read<GRPCProvider>().getTaskParentList(User(id: "sd")),
        builder: (context, snapshot) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: bgColor1,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ListTile(
                            title: Text(
                              "Task Progress",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                            subtitle: Consumer<GRPCProvider>(
                              builder: (context, value, child) => Text(
                                "${value.getTotalCompletedTasks()}/${value.totalNumberOfTasks()} tasks done",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 100,
                          width: 100,
                          child: Consumer<GRPCProvider>(
                            builder: (context, taskProvider, child) => Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: TweenAnimationBuilder(
                                      duration:
                                          const Duration(microseconds: 600),
                                      tween: Tween<double>(
                                          begin: 0,
                                          end:
                                              taskProvider.getEntireProgress()),
                                      curve: Curves.linear,
                                      builder: (context, value, _) {
                                        return CircularProgressIndicator(
                                          value: value,
                                          strokeWidth: 9,
                                          color: const Color(0xff3f37c9),
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  green),
                                          backgroundColor: bgColor,
                                          strokeCap: StrokeCap.round,
                                        );
                                      }),
                                ),
                                Positioned(
                                    child: Text(
                                  "${(double.parse(taskProvider.getEntireProgress().toStringAsFixed(2)) * 100).toStringAsFixed(1)}%",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ))
                              ],
                            ),
                          ))
                    ],
                  ),
                  Container(
                    height: 30,
                    // width: 100,
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xff3f37c9),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Consumer<GRPCProvider>(
                      builder: (context, taskProvider, child) => Text(
                        taskProvider.taskParents
                            // .sublist(0, 4)
                            .map((e) => e.date)
                            .join(" | "),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
