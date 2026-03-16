// it will have field: source(String), payload(Map<String, dynamic>, and timestamp
class NotificationLocalEntity {
  const NotificationLocalEntity({
    required this.source,
    required this.payload,
    required this.timestamp,
  });

  final String source;
  final Map<String, dynamic> payload;
  final DateTime timestamp;

  // Factory method to create an instance from a JSON map
  factory NotificationLocalEntity.fromJson(Map<String, dynamic> json) {
    return NotificationLocalEntity(
      source: json['source'] as String,
      payload: json['payload'] as Map<String, dynamic>,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  // Method to convert the instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'source': source,
      'payload': payload,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
