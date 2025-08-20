// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Post _$PostFromJson(Map<String, dynamic> json) => _Post(
  id: json['id'] as String,
  text: json['text'] as String,
  status: $enumDecode(_$ReminderStatusEnumMap, json['status']),
  timezone: json['timezone'] as String,
  updatedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
    json['updatedAt'],
    const DateTimeTimestampConverter().fromJson,
  ),
  createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
    json['createdAt'],
    const DateTimeTimestampConverter().fromJson,
  ),
  scheduledAt: _$JsonConverterFromJson<Timestamp, DateTime>(
    json['scheduledAt'],
    const DateTimeTimestampConverter().fromJson,
  ),
);

Map<String, dynamic> _$PostToJson(_Post instance) => <String, dynamic>{
  'id': instance.id,
  'text': instance.text,
  'status': _$ReminderStatusEnumMap[instance.status]!,
  'timezone': instance.timezone,
  'updatedAt': _$JsonConverterToJson<Timestamp, DateTime>(
    instance.updatedAt,
    const DateTimeTimestampConverter().toJson,
  ),
  'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
    instance.createdAt,
    const DateTimeTimestampConverter().toJson,
  ),
  'scheduledAt': _$JsonConverterToJson<Timestamp, DateTime>(
    instance.scheduledAt,
    const DateTimeTimestampConverter().toJson,
  ),
};

const _$ReminderStatusEnumMap = {
  ReminderStatus.pending: 'pending',
  ReminderStatus.done: 'done',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
