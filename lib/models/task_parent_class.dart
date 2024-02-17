import 'package:flutter/material.dart';
import 'package:task_manager/models/task_model.dart';

class TaskParentModel {
  String title, subtitle, description;
  List<TaskModel> tasks;
  String date, time;

  // Constructor for creating a new task parent model
  TaskParentModel(
      {required this.title,
      this.subtitle = "",
      required this.description,
      required this.date,
      required this.time,
      this.tasks = const []});
}
