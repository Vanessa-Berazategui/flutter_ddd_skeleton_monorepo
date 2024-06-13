// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CounterResponse _$CounterResponseFromJson(Map<String, dynamic> json) =>
    CounterResponse(
      text: json['text'] as String,
      found: json['found'] as bool,
      number: (json['number'] as num).toInt(),
      type: json['type'] as String,
    );

Map<String, dynamic> _$CounterResponseToJson(CounterResponse instance) =>
    <String, dynamic>{
      'text': instance.text,
      'found': instance.found,
      'number': instance.number,
      'type': instance.type,
    };
