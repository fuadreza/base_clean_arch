class NumberConstants {
  //#region APPLICATION

  static const List<int> httpStatusOk = [200, 201];
  static const int httpStatusBadGateway = 502;
  static const int httpNotAuthorized = 401;
  static const int httpBadRequest = 400;
  static const int httpTimeout = 408;
  static const int httpToManyRequest = 429;
  static const int maxLimitResend = 3;

  static const Duration httpConnectTimeout = Duration(milliseconds: 120000);
  static const Duration httpReceiveTimeout = Duration(milliseconds: 120000);
  static const Duration httpSendTimeout = Duration(milliseconds: 120000);

  static const Duration receiveTimeout = Duration(seconds: 60);
  static const Duration connectionTimeout = Duration(seconds: 60);

  //#endregion

  //#region SENTRY

  static const List<int> sentryFilterHttpException = [400, 401];

//#endregion SENTRY
}
