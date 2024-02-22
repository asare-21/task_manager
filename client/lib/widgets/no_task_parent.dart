import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class NoTaskParent extends StatelessWidget {
  const NoTaskParent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          LottieBuilder.asset("assets/lottie/empty.json",
              height: 200, width: 200, fit: BoxFit.cover),
          Text(
            "No Task Parent Found",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const Gap(15),
          Text(
            "Tap 'Add new task +' to create a new task",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
