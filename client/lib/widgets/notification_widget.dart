import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/config/globals.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 5,
            color: bgColor1.withOpacity(0.5),
            blurStyle: BlurStyle.outer,
            spreadRadius: 2)
      ], color: bgColor1, borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        ListTile(
          onTap: () => context.pushNamed("tasks"),
          leading: CircleAvatar(
            backgroundColor: bgColor1,
            child: Icon(
              Icons.notifications,
              color: grey,
            ),
          ),
          title: Text(
            "You have 3 new tasks",
            style: TextStyle(
                color: grey, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(
            "Tap to view",
            style: TextStyle(color: grey, fontSize: 14),
          ),
        ),
      ]),
    );
  }
}
