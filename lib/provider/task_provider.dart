import 'package:flutter/material.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/models/task_parent_class.dart';

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
}
