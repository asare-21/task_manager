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

  // update task parent
  void updateTaskParent(TaskParentModel taskParent) {
    int index = _tasksParents
        .indexWhere((element) => element.title == taskParent.title);
    if (index == -1) return;
    _tasksParents[index] = taskParent;
    notifyListeners();
  }

  void updateTask(TaskModel task) {
    
  }
}
