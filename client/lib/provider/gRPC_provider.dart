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

  Future<void> updateTask(TaskModel taskModel) async {
    try {
      var response = await _stub.updateTask(taskModel);
      debugPrint('Response: ${response.writeToJson()}');
    } catch (e) {
      debugPrint('Caught error: $e');
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
