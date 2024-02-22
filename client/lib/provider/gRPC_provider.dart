import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:protos/protos.dart';

final _channel = ClientChannel('localhost',
    port: 50051,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()));

var _stub = TaskServiceClient(_channel,
    options: CallOptions(timeout: const Duration(seconds: 30)));
var _secondStud = GreeterClient(_channel,
    options: CallOptions(timeout: const Duration(seconds: 30)));

class GRPCProvider extends ChangeNotifier {
  Future<void> createTaskParent(TaskParentModel taskParentModel) async {
    try {
      var response = await _stub.addTaskParent(taskParentModel);
      debugPrint('Response: ${response.writeToJson()}');
    } catch (e) {
      debugPrint('Caught error: $e');
    }
  }

  Future<void> getTaskParentList(TaskParentModel taskParentModel) async {
    try {
      var response = await _stub.getTaskParentList(taskParentModel);
      debugPrint('Response: ${response.writeToJson()}');
    } catch (e) {
      debugPrint('Caught error: $e');
    }
  }

  Future<void> getTaskList(TaskParentModel taskParentModel) async {
    try {
      var response = await _stub.getTaskList(taskParentModel);
      debugPrint('Response: ${response.writeToJson()}');
    } catch (e) {
      debugPrint('Caught error: $e');
    }
  }

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

  Future<void> sayHello() async {
    try {
      var response = await _secondStud.sayHello(HelloRequest()..name = 'Dart');
      debugPrint('Response: ${response.writeToJson()}');
    } catch (e) {
      debugPrint('Caught error: $e');
    }
  }
}
