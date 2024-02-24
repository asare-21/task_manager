//
//  Generated code. Do not modify.
//  source: task.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'task.pb.dart' as $0;

export 'task.pb.dart';

@$pb.GrpcServiceName('TaskService')
class TaskServiceClient extends $grpc.Client {
  static final _$getTaskParentList = $grpc.ClientMethod<$0.User, $0.TaskParentListResponse>(
      '/TaskService/GetTaskParentList',
      ($0.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TaskParentListResponse.fromBuffer(value));
  static final _$addTask = $grpc.ClientMethod<$0.TaskModel, $0.TaskModel>(
      '/TaskService/AddTask',
      ($0.TaskModel value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TaskModel.fromBuffer(value));
  static final _$updateTask = $grpc.ClientMethod<$0.TaskModel, $0.TaskModel>(
      '/TaskService/UpdateTask',
      ($0.TaskModel value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TaskModel.fromBuffer(value));
  static final _$deleteTask = $grpc.ClientMethod<$0.TaskModel, $0.TaskModel>(
      '/TaskService/DeleteTask',
      ($0.TaskModel value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TaskModel.fromBuffer(value));
  static final _$addTaskParent = $grpc.ClientMethod<$0.TaskParentModel, $0.TaskParentModel>(
      '/TaskService/AddTaskParent',
      ($0.TaskParentModel value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TaskParentModel.fromBuffer(value));
  static final _$updateTaskModel = $grpc.ClientMethod<$0.TaskModelUpdate, $0.TaskModel>(
      '/TaskService/UpdateTaskModel',
      ($0.TaskModelUpdate value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TaskModel.fromBuffer(value));

  TaskServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.TaskParentListResponse> getTaskParentList($0.User request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTaskParentList, request, options: options);
  }

  $grpc.ResponseFuture<$0.TaskModel> addTask($0.TaskModel request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addTask, request, options: options);
  }

  $grpc.ResponseFuture<$0.TaskModel> updateTask($0.TaskModel request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateTask, request, options: options);
  }

  $grpc.ResponseFuture<$0.TaskModel> deleteTask($0.TaskModel request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteTask, request, options: options);
  }

  $grpc.ResponseFuture<$0.TaskParentModel> addTaskParent($0.TaskParentModel request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addTaskParent, request, options: options);
  }

  $grpc.ResponseFuture<$0.TaskModel> updateTaskModel($0.TaskModelUpdate request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateTaskModel, request, options: options);
  }
}

@$pb.GrpcServiceName('TaskService')
abstract class TaskServiceBase extends $grpc.Service {
  $core.String get $name => 'TaskService';

  TaskServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.User, $0.TaskParentListResponse>(
        'GetTaskParentList',
        getTaskParentList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.User.fromBuffer(value),
        ($0.TaskParentListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TaskModel, $0.TaskModel>(
        'AddTask',
        addTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TaskModel.fromBuffer(value),
        ($0.TaskModel value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TaskModel, $0.TaskModel>(
        'UpdateTask',
        updateTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TaskModel.fromBuffer(value),
        ($0.TaskModel value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TaskModel, $0.TaskModel>(
        'DeleteTask',
        deleteTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TaskModel.fromBuffer(value),
        ($0.TaskModel value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TaskParentModel, $0.TaskParentModel>(
        'AddTaskParent',
        addTaskParent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TaskParentModel.fromBuffer(value),
        ($0.TaskParentModel value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TaskModelUpdate, $0.TaskModel>(
        'UpdateTaskModel',
        updateTaskModel_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TaskModelUpdate.fromBuffer(value),
        ($0.TaskModel value) => value.writeToBuffer()));
  }

  $async.Future<$0.TaskParentListResponse> getTaskParentList_Pre($grpc.ServiceCall call, $async.Future<$0.User> request) async {
    return getTaskParentList(call, await request);
  }

  $async.Future<$0.TaskModel> addTask_Pre($grpc.ServiceCall call, $async.Future<$0.TaskModel> request) async {
    return addTask(call, await request);
  }

  $async.Future<$0.TaskModel> updateTask_Pre($grpc.ServiceCall call, $async.Future<$0.TaskModel> request) async {
    return updateTask(call, await request);
  }

  $async.Future<$0.TaskModel> deleteTask_Pre($grpc.ServiceCall call, $async.Future<$0.TaskModel> request) async {
    return deleteTask(call, await request);
  }

  $async.Future<$0.TaskParentModel> addTaskParent_Pre($grpc.ServiceCall call, $async.Future<$0.TaskParentModel> request) async {
    return addTaskParent(call, await request);
  }

  $async.Future<$0.TaskModel> updateTaskModel_Pre($grpc.ServiceCall call, $async.Future<$0.TaskModelUpdate> request) async {
    return updateTaskModel(call, await request);
  }

  $async.Future<$0.TaskParentListResponse> getTaskParentList($grpc.ServiceCall call, $0.User request);
  $async.Future<$0.TaskModel> addTask($grpc.ServiceCall call, $0.TaskModel request);
  $async.Future<$0.TaskModel> updateTask($grpc.ServiceCall call, $0.TaskModel request);
  $async.Future<$0.TaskModel> deleteTask($grpc.ServiceCall call, $0.TaskModel request);
  $async.Future<$0.TaskParentModel> addTaskParent($grpc.ServiceCall call, $0.TaskParentModel request);
  $async.Future<$0.TaskModel> updateTaskModel($grpc.ServiceCall call, $0.TaskModelUpdate request);
}
