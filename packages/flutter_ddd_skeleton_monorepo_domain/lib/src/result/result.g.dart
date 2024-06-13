// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FailureServerImpl _$$FailureServerImplFromJson(Map<String, dynamic> json) =>
    _$FailureServerImpl(
      message: json['message'] as String,
      code: (json['code'] as num?)?.toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FailureServerImplToJson(_$FailureServerImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'runtimeType': instance.$type,
    };

_$FailureUnauthorizedImpl _$$FailureUnauthorizedImplFromJson(
        Map<String, dynamic> json) =>
    _$FailureUnauthorizedImpl(
      json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FailureUnauthorizedImplToJson(
        _$FailureUnauthorizedImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };

_$FailureUnexpectedImpl _$$FailureUnexpectedImplFromJson(
        Map<String, dynamic> json) =>
    _$FailureUnexpectedImpl(
      json['e'] as Object,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FailureUnexpectedImplToJson(
        _$FailureUnexpectedImpl instance) =>
    <String, dynamic>{
      'e': instance.e,
      'runtimeType': instance.$type,
    };

_$FailureConnectTimeOutImpl _$$FailureConnectTimeOutImplFromJson(
        Map<String, dynamic> json) =>
    _$FailureConnectTimeOutImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FailureConnectTimeOutImplToJson(
        _$FailureConnectTimeOutImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$FailureSendTimeOutImpl _$$FailureSendTimeOutImplFromJson(
        Map<String, dynamic> json) =>
    _$FailureSendTimeOutImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FailureSendTimeOutImplToJson(
        _$FailureSendTimeOutImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$FailureReceiveTimeoutImpl _$$FailureReceiveTimeoutImplFromJson(
        Map<String, dynamic> json) =>
    _$FailureReceiveTimeoutImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FailureReceiveTimeoutImplToJson(
        _$FailureReceiveTimeoutImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$FailureCacheImpl _$$FailureCacheImplFromJson(Map<String, dynamic> json) =>
    _$FailureCacheImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FailureCacheImplToJson(_$FailureCacheImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$FailureQuizImpl _$$FailureQuizImplFromJson(Map<String, dynamic> json) =>
    _$FailureQuizImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FailureQuizImplToJson(_$FailureQuizImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
