import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:protos/protos.dart';

final _channel = ClientChannel('localhost',
    port: 50051,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()));

var _stub = TaskServiceClient(_channel,
    options: CallOptions(timeout: const Duration(seconds: 30)));

class GRPCProvider extends ChangeNotifier {
  final List<TaskParentModel> _taskParents = [];
  List<TaskParentModel> get taskParents => _taskParents;

// compute entire task parent model progress
  double getEntireProgress() {
    if (_taskParents.isEmpty) return 0.0;
    double total = 0;
    double done = 0;
    for (var element in _taskParents) {
      for (var task in element.tasks) {
        total++;
        if (task.isDone) done++;
      }
    }
    return done / total;
  }

  int totalNumberOfTasks() {
    if (_taskParents.isEmpty) return 0;
    int total = 0;
    for (var element in _taskParents) {
      for (int i = 0; i < element.tasks.length; i++) {
        total++;
      }
    }
    return total;
  }

  int getTotalCompletedTasks() {
    if (_taskParents.isEmpty) return 0;
    int done = 0;
    for (var element in _taskParents) {
      for (var task in element.tasks) {
        if (task.isDone) done++;
      }
    }
    return done;
  }

  getSingleTaskParentProgress(String id) {
    if (_taskParents.isEmpty) return 0.0;
    int index = _taskParents.indexWhere((element) => element.id == id);
    if (index == -1) return 0.0;
    double total = 0;
    double done = 0;
    for (var task in _taskParents[index].tasks) {
      total++;
      if (task.isDone) done++;
    }
    return done / total;
  }

  Future<void> createTaskParent(TaskParentModel taskParentModel) async {
    try {
      var response = await _stub.addTaskParent(taskParentModel);
      debugPrint('Response: $response');
    } catch (e) {
      debugPrint('Caught error: $e');
    }
  }

  Future<void> getTaskParentList(User user) async {
    try {
      var response = await _stub.getTaskParentList(user);

      for (var element in response.taskParents) {
        if (!_taskParents.contains(element)) {
          _taskParents.add(element);
        }
      }

      notifyListeners();
    } catch (e) {
      debugPrint('Caught error: $e');
    }
  }

  // Future<void> getTaskList(User user) async {
  //   try {
  //     var response = await _stub.getTaskParentList(user);
  //     debugPrint('Response: ${response.taskParents[0].title}');
  //   } catch (e) {
  //     debugPrint('Caught error: $e');
  //   }
  // }

  Future<void> addTask(TaskModel taskModel) async {
    try {
      var response = await _stub.addTask(taskModel);
      debugPrint('Response: ${response.writeToJson()}');
    } catch (e) {
      debugPrint('Caught error: $e');
    }
  }

  Future<void> updateTask(TaskModelUpdate taskModel) async {
    try {
      // _stub.taskM
      await _stub.updateTaskModel(taskModel);
      await getTaskParentList(User(id: taskModel.user.id));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteTask(TaskModel taskModel) async {
    try {
      var response = await _stub.deleteTask(taskModel);
      debugPrint('Response: ${response.writeToJson()}');
    } catch (e) {
      debugPrint('Caught error: $e');
    }
  }
}
