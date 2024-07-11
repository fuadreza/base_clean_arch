import 'dart:math';

import 'package:dio/dio.dart';

class CustomInterceptors extends Interceptor {
  CustomInterceptors();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String? token;
    if (Random().nextBool()) {
      token = 'sampleToken';
    }
    options.headers['Accept'] = '*/*';
    options.headers['origin'] = 'https://example.com';
    options.connectTimeout = const Duration(milliseconds: 120000);
    options.receiveTimeout = const Duration(milliseconds: 120000);
    options.sendTimeout = const Duration(milliseconds: 120000);
    if (token != null) options.headers['Authorization'] = token;

    return super.onRequest(options, handler);
  }
}
