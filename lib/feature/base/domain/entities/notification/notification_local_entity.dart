// it will have field: source(String), payload(Map<String, dynamic>, and timestamp

import 'package:json_annotation/json_annotation.dart';

part 'notification_local_entity.g.dart';

@JsonSerializable()
class NotificationLocalEntity {
  const NotificationLocalEntity({
    required this.source,
    required this.payload,
    required this.timestamp,
  });

  @JsonKey(name: 'source')
  final String source;
  @JsonKey(name: 'payload')
  final Map<String, dynamic> payload;
  @JsonKey(name: 'timestamp')
  final DateTime timestamp;

  factory NotificationLocalEntity.fromJson(Map<String, dynamic> json) => _$NotificationLocalEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationLocalEntityToJson(this);
}
