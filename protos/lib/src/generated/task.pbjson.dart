//
//  Generated code. Do not modify.
//  source: task.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use taskModelDescriptor instead')
const TaskModel$json = {
  '1': 'TaskModel',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'isDone', '3': 3, '4': 1, '5': 8, '10': 'isDone'},
    {'1': 'parent', '3': 4, '4': 1, '5': 9, '10': 'parent'},
  ],
};

/// Descriptor for `TaskModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskModelDescriptor = $convert.base64Decode(
    'CglUYXNrTW9kZWwSDgoCaWQYASABKAlSAmlkEhQKBXRpdGxlGAIgASgJUgV0aXRsZRIWCgZpc0'
    'RvbmUYAyABKAhSBmlzRG9uZRIWCgZwYXJlbnQYBCABKAlSBnBhcmVudA==');

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'access_token', '3': 2, '4': 1, '5': 9, '10': 'accessToken'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEg4KAmlkGAEgASgJUgJpZBIhCgxhY2Nlc3NfdG9rZW4YAiABKAlSC2FjY2Vzc1Rva2'
    'Vu');

@$core.Deprecated('Use taskParentModelDescriptor instead')
const TaskParentModel$json = {
  '1': 'TaskParentModel',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'subtitle', '3': 2, '4': 1, '5': 9, '10': 'subtitle'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'tasks', '3': 4, '4': 3, '5': 11, '6': '.TaskModel', '10': 'tasks'},
    {'1': 'date', '3': 5, '4': 1, '5': 9, '10': 'date'},
    {'1': 'time', '3': 6, '4': 1, '5': 9, '10': 'time'},
    {'1': 'id', '3': 7, '4': 1, '5': 9, '10': 'id'},
    {'1': 'user', '3': 8, '4': 1, '5': 11, '6': '.User', '10': 'user'},
  ],
};

/// Descriptor for `TaskParentModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskParentModelDescriptor = $convert.base64Decode(
    'Cg9UYXNrUGFyZW50TW9kZWwSFAoFdGl0bGUYASABKAlSBXRpdGxlEhoKCHN1YnRpdGxlGAIgAS'
    'gJUghzdWJ0aXRsZRIgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SIAoFdGFza3MY'
    'BCADKAsyCi5UYXNrTW9kZWxSBXRhc2tzEhIKBGRhdGUYBSABKAlSBGRhdGUSEgoEdGltZRgGIA'
    'EoCVIEdGltZRIOCgJpZBgHIAEoCVICaWQSGQoEdXNlchgIIAEoCzIFLlVzZXJSBHVzZXI=');

@$core.Deprecated('Use taskParentListResponseDescriptor instead')
const TaskParentListResponse$json = {
  '1': 'TaskParentListResponse',
  '2': [
    {'1': 'task_parents', '3': 1, '4': 3, '5': 11, '6': '.TaskParentModel', '10': 'taskParents'},
    {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.User', '10': 'user'},
  ],
};

/// Descriptor for `TaskParentListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskParentListResponseDescriptor = $convert.base64Decode(
    'ChZUYXNrUGFyZW50TGlzdFJlc3BvbnNlEjMKDHRhc2tfcGFyZW50cxgBIAMoCzIQLlRhc2tQYX'
    'JlbnRNb2RlbFILdGFza1BhcmVudHMSGQoEdXNlchgCIAEoCzIFLlVzZXJSBHVzZXI=');

@$core.Deprecated('Use taskModelUpdateDescriptor instead')
const TaskModelUpdate$json = {
  '1': 'TaskModelUpdate',
  '2': [
    {'1': 'task', '3': 1, '4': 1, '5': 11, '6': '.TaskModel', '10': 'task'},
    {'1': 'parent', '3': 2, '4': 1, '5': 9, '10': 'parent'},
    {'1': 'user', '3': 3, '4': 1, '5': 11, '6': '.User', '10': 'user'},
  ],
};

/// Descriptor for `TaskModelUpdate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskModelUpdateDescriptor = $convert.base64Decode(
    'Cg9UYXNrTW9kZWxVcGRhdGUSHgoEdGFzaxgBIAEoCzIKLlRhc2tNb2RlbFIEdGFzaxIWCgZwYX'
    'JlbnQYAiABKAlSBnBhcmVudBIZCgR1c2VyGAMgASgLMgUuVXNlclIEdXNlcg==');

