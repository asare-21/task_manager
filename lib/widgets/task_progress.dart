import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/config/globals.dart';
import 'package:task_manager/provider/task_provider.dart';

class TaskProgress extends StatelessWidget {
  const TaskProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor1,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ListTile(
                      title: Text(
                        "Task Progress",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Consumer<TaskProvider>(
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
                  Container(
                    height: 30,
                    width: 100,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xff3f37c9),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "March 22",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
                height: 100,
                width: 100,
                child: Consumer<TaskProvider>(
                  builder: (context, taskProvider, child) => Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: TweenAnimationBuilder(
                            duration: const Duration(microseconds: 600),
                            tween: Tween<double>(
                                begin: 0,
                                end: taskProvider.getEntireProgress()),
                            curve: Curves.linear,
                            builder: (context, value, _) {
                              return CircularProgressIndicator(
                                value: value,
                                strokeWidth: 9,
                                color: const Color(0xff3f37c9),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.greenAccent[400]!),
                                backgroundColor: bgColor,
                                strokeCap: StrokeCap.round,
                              );
                            }),
                      ),
                      Positioned(
                          child: Text(
                        "${taskProvider.getEntireProgress().floor() * 100}%",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
