import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_manager/widgets/notification_widget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifications",
        ),
      ),
      body: ListView(
        children: const [NotificationsWidget()],
      ),
    );
  }
}
