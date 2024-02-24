//
//  Generated code. Do not modify.
//  source: task.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TaskModel extends $pb.GeneratedMessage {
  factory TaskModel({
    $core.String? id,
    $core.String? title,
    $core.bool? isDone,
    $core.String? parent,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (title != null) {
      $result.title = title;
    }
    if (isDone != null) {
      $result.isDone = isDone;
    }
    if (parent != null) {
      $result.parent = parent;
    }
    return $result;
  }
  TaskModel._() : super();
  factory TaskModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TaskModel', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOB(3, _omitFieldNames ? '' : 'isDone')
    ..aOS(4, _omitFieldNames ? '' : 'parent')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskModel clone() => TaskModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskModel copyWith(void Function(TaskModel) updates) => super.copyWith((message) => updates(message as TaskModel)) as TaskModel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskModel create() => TaskModel._();
  TaskModel createEmptyInstance() => create();
  static $pb.PbList<TaskModel> createRepeated() => $pb.PbList<TaskModel>();
  @$core.pragma('dart2js:noInline')
  static TaskModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskModel>(create);
  static TaskModel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isDone => $_getBF(2);
  @$pb.TagNumber(3)
  set isDone($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsDone() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsDone() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get parent => $_getSZ(3);
  @$pb.TagNumber(4)
  set parent($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasParent() => $_has(3);
  @$pb.TagNumber(4)
  void clearParent() => clearField(4);
}

class User extends $pb.GeneratedMessage {
  factory User({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  User._() : super();
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'User', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  User clone() => User()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User)) as User;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class TaskParentModel extends $pb.GeneratedMessage {
  factory TaskParentModel({
    $core.String? title,
    $core.String? subtitle,
    $core.String? description,
    $core.Iterable<TaskModel>? tasks,
    $core.String? date,
    $core.String? time,
    $core.String? id,
  }) {
    final $result = create();
    if (title != null) {
      $result.title = title;
    }
    if (subtitle != null) {
      $result.subtitle = subtitle;
    }
    if (description != null) {
      $result.description = description;
    }
    if (tasks != null) {
      $result.tasks.addAll(tasks);
    }
    if (date != null) {
      $result.date = date;
    }
    if (time != null) {
      $result.time = time;
    }
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  TaskParentModel._() : super();
  factory TaskParentModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskParentModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TaskParentModel', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'subtitle')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..pc<TaskModel>(4, _omitFieldNames ? '' : 'tasks', $pb.PbFieldType.PM, subBuilder: TaskModel.create)
    ..aOS(5, _omitFieldNames ? '' : 'date')
    ..aOS(6, _omitFieldNames ? '' : 'time')
    ..aOS(7, _omitFieldNames ? '' : 'Id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskParentModel clone() => TaskParentModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskParentModel copyWith(void Function(TaskParentModel) updates) => super.copyWith((message) => updates(message as TaskParentModel)) as TaskParentModel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskParentModel create() => TaskParentModel._();
  TaskParentModel createEmptyInstance() => create();
  static $pb.PbList<TaskParentModel> createRepeated() => $pb.PbList<TaskParentModel>();
  @$core.pragma('dart2js:noInline')
  static TaskParentModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskParentModel>(create);
  static TaskParentModel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get subtitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set subtitle($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubtitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubtitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<TaskModel> get tasks => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get date => $_getSZ(4);
  @$pb.TagNumber(5)
  set date($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearDate() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get time => $_getSZ(5);
  @$pb.TagNumber(6)
  set time($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get id => $_getSZ(6);
  @$pb.TagNumber(7)
  set id($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasId() => $_has(6);
  @$pb.TagNumber(7)
  void clearId() => clearField(7);
}

class TaskParentListResponse extends $pb.GeneratedMessage {
  factory TaskParentListResponse({
    $core.Iterable<TaskParentModel>? taskParents,
  }) {
    final $result = create();
    if (taskParents != null) {
      $result.taskParents.addAll(taskParents);
    }
    return $result;
  }
  TaskParentListResponse._() : super();
  factory TaskParentListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskParentListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TaskParentListResponse', createEmptyInstance: create)
    ..pc<TaskParentModel>(1, _omitFieldNames ? '' : 'taskParents', $pb.PbFieldType.PM, subBuilder: TaskParentModel.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskParentListResponse clone() => TaskParentListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskParentListResponse copyWith(void Function(TaskParentListResponse) updates) => super.copyWith((message) => updates(message as TaskParentListResponse)) as TaskParentListResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskParentListResponse create() => TaskParentListResponse._();
  TaskParentListResponse createEmptyInstance() => create();
  static $pb.PbList<TaskParentListResponse> createRepeated() => $pb.PbList<TaskParentListResponse>();
  @$core.pragma('dart2js:noInline')
  static TaskParentListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskParentListResponse>(create);
  static TaskParentListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TaskParentModel> get taskParents => $_getList(0);
}

class TaskModelUpdate extends $pb.GeneratedMessage {
  factory TaskModelUpdate({
    TaskModel? task,
    $core.String? parent,
    User? user,
  }) {
    final $result = create();
    if (task != null) {
      $result.task = task;
    }
    if (parent != null) {
      $result.parent = parent;
    }
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  TaskModelUpdate._() : super();
  factory TaskModelUpdate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskModelUpdate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TaskModelUpdate', createEmptyInstance: create)
    ..aOM<TaskModel>(1, _omitFieldNames ? '' : 'task', subBuilder: TaskModel.create)
    ..aOS(2, _omitFieldNames ? '' : 'parent')
    ..aOM<User>(3, _omitFieldNames ? '' : 'user', subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskModelUpdate clone() => TaskModelUpdate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskModelUpdate copyWith(void Function(TaskModelUpdate) updates) => super.copyWith((message) => updates(message as TaskModelUpdate)) as TaskModelUpdate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskModelUpdate create() => TaskModelUpdate._();
  TaskModelUpdate createEmptyInstance() => create();
  static $pb.PbList<TaskModelUpdate> createRepeated() => $pb.PbList<TaskModelUpdate>();
  @$core.pragma('dart2js:noInline')
  static TaskModelUpdate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskModelUpdate>(create);
  static TaskModelUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  TaskModel get task => $_getN(0);
  @$pb.TagNumber(1)
  set task(TaskModel v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTask() => $_has(0);
  @$pb.TagNumber(1)
  void clearTask() => clearField(1);
  @$pb.TagNumber(1)
  TaskModel ensureTask() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get parent => $_getSZ(1);
  @$pb.TagNumber(2)
  set parent($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasParent() => $_has(1);
  @$pb.TagNumber(2)
  void clearParent() => clearField(2);

  @$pb.TagNumber(3)
  User get user => $_getN(2);
  @$pb.TagNumber(3)
  set user(User v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearUser() => clearField(3);
  @$pb.TagNumber(3)
  User ensureUser() => $_ensure(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
