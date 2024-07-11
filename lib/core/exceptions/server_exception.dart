class ServerException implements Exception {
  ServerException({
    this.message,
    this.code,
    this.path,
    this.messageString,
    this.attributes,
  });

  final String? message;
  final String? messageString;
  final int? code;
  final String? path;
  final dynamic attributes;
}
