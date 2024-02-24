import 'package:flutter/material.dart';
import 'package:protos/protos.dart';


class TaskProvider with ChangeNotifier {
  final List<TaskParentModel> _tasksParents = [];

  List<TaskParentModel> get taskParents => _tasksParents;

  void addTask(TaskModel task, String parentTitle) {
    if (_tasksParents.isEmpty) return;
    int index =
        _tasksParents.indexWhere((element) => element.title == parentTitle);
    if (index == -1) return;
    _tasksParents[index].tasks.add(task);
    notifyListeners();
  }

  void removeTask(TaskModel task, String parentTitle) {
    if (_tasksParents.isEmpty) return;

    int index =
        _tasksParents.indexWhere((element) => element.title == parentTitle);
    if (index == -1) return;
    _tasksParents[index].tasks.remove(task);

    notifyListeners();
  }

  void createTaskParent(TaskParentModel taskParent) {
    _tasksParents.add(taskParent);
    notifyListeners();
  }

  void deleteTask(TaskParentModel taskParent) {
    _tasksParents.remove(taskParent);
    notifyListeners();
  }

  // Get the tasks of a specific parent
  List<TaskModel> getTasks(String parentTitle) {
    if (_tasksParents.isEmpty) return [];
    int index =
        _tasksParents.indexWhere((element) => element.title == parentTitle);
    if (index == -1) return [];
    return _tasksParents[index].tasks;
  }

  // compute entire task parent model progress
  double getEntireProgress() {
    if (_tasksParents.isEmpty) return 0.0;
    double total = 0;
    double done = 0;
    for (var element in _tasksParents) {
      for (var task in element.tasks) {
        total++;
        if (task.isDone) done++;
      }
    }
    return done / total;
  }

  int totalNumberOfTasks() {
    if (_tasksParents.isEmpty) return 0;
    int total = 0;
    for (var element in _tasksParents) {
      for (int i = 0; i < element.tasks.length; i++) {
        total++;
      }
    }
    return total;
  }

  int getTotalCompletedTasks() {
    if (_tasksParents.isEmpty) return 0;
    int done = 0;
    for (var element in _tasksParents) {
      for (var task in element.tasks) {
        if (task.isDone) done++;
      }
    }
    return done;
  }

  getSingleTaskParentProgress(String title) {
    if (_tasksParents.isEmpty) return 0.0;
    int index = _tasksParents.indexWhere((element) => element.title == title);
    if (index == -1) return 0.0;
    double total = 0;
    double done = 0;
    for (var task in _tasksParents[index].tasks) {
      total++;
      if (task.isDone) done++;
    }
    return done / total;
  }

  // update task parent
  void updateTaskParent(TaskParentModel taskParent) {
    int index = _tasksParents
        .indexWhere((element) => element.title == taskParent.title);
    if (index == -1) return;
    _tasksParents[index] = taskParent;
    notifyListeners();
  }
}
