import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_manager/config/globals.dart';

class NoNotificationsWidget extends StatelessWidget {
  const NoNotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        LottieBuilder.asset(
          "assets/lottie/empty.json",
          height: 150,
          width: 150,
        ),
        Text(
          "No notifications yet!",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "You will be notified when you have new tasks",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: grey1),
        )
      ]),
    );
  }
}
