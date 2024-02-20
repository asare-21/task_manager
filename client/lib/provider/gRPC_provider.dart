import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:protos/src/generated/task.pbgrpc.dart';

final _channel = ClientChannel('127.0.0.1',
    port: 50051,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()));

var _stub = TaskServiceClient(_channel,
    options: CallOptions(timeout: const Duration(seconds: 30)));

class GRPCProvider extends ChangeNotifier {
  TaskParentModel taskParentModel = TaskParentModel();
  TaskModel taskModel = TaskModel();

  Future<void> getTaskParentList() async {
    try {
      var response = await _stub.getTaskParentList(taskParentModel);
      print('Response: ${response.writeToJson()}');
    } catch (e) {
      print('Caught error: $e');
    }
  }

  Future<void> getTaskList() async {
    try {
      var response = await _stub.getTaskList(taskParentModel);
      print('Response: ${response.writeToJson()}');
    } catch (e) {
      print('Caught error: $e');
    }
  }

  Future<void> addTask() async {
    try {
      var response = await _stub.addTask(taskModel);
      print('Response: ${response.writeToJson()}');
    } catch (e) {
      print('Caught error: $e');
    }
  }

  Future<void> updateTask() async {
    try {
      var response = await _stub.updateTask(taskModel);
      print('Response: ${response.writeToJson()}');
    } catch (e) {
      print('Caught error: $e');
    }
  }

  Future<void> deleteTask() async {
    try {
      var response = await _stub.deleteTask(taskModel);
      print('Response: ${response.writeToJson()}');
    } catch (e) {
      print('Caught error: $e');
    }
  }
}
