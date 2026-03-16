// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_local_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationLocalEntity _$NotificationLocalEntityFromJson(
        Map<String, dynamic> json) =>
    NotificationLocalEntity(
      source: json['source'] as String,
      payload: json['payload'] as Map<String, dynamic>,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$NotificationLocalEntityToJson(
        NotificationLocalEntity instance) =>
    <String, dynamic>{
      'source': instance.source,
      'payload': instance.payload,
      'timestamp': instance.timestamp.toIso8601String(),
    };
