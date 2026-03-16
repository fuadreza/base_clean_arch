import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:ansicolor/ansicolor.dart';
import 'package:base_clean_arch/core/configs/env/environment.dart';
import 'package:base_clean_arch/core/constants/number_constants.dart';
import 'package:base_clean_arch/core/constants/string_constants.dart';
import 'package:dio/dio.dart';
import 'package:sentry_dio/sentry_dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

// Reference from:
// https://github.com/sinnoorc/flutter_dio_example/blob/main/lib/app/data/network/service/api_service.dart

class BaseApiService {
  BaseApiService(BaseOptions? options, {List<Interceptor>? interceptors}) {
    if (options != null) {
      _dio.options = options;
    }
    _dio
      ..interceptors.add(Platform.isIOS ? logInterceptor : talkerDioLogger)
      ..interceptors.addAll(
        interceptors ?? [],
      )
      ..addSentry();
  }

  static final options = BaseOptions(
    baseUrl: Environment.appHostUrl,
    connectTimeout: NumberConstants.connectionTimeout,
    receiveTimeout: NumberConstants.receiveTimeout,
    headers: {
      'Accept': 'application/json',
    },
    validateStatus: (status) {
      if (status == null) {
        return false;
      }
      if (status == 422 || status == 400) {
        return true;
      } else {
        return status >= 200 && status < 300;
      }
    },
  );

  // dio instance
  final Dio _dio = Dio(options);

  static final talkerDioLogger = TalkerDioLogger(
    settings: TalkerDioLoggerSettings(
      printRequestHeaders: true,
      printResponseHeaders: true,
      printResponseMessage: true,
      requestPen: AnsiPen()..blue(),
      responsePen: AnsiPen()..rgb(r: 1.0, g: 0.5, b: 0.0),
    ),
  );

  static final logInterceptor = LogInterceptor(
    request: true,
    requestHeader: false,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    logPrint: (Object object) {
      log(object.toString());
    },
  );

  //#region SETTER

  void setBaseUrl({
    required String baseUrl,
  }) {
    _dio.options.baseUrl = baseUrl;
  }

  void setHeader({
    String? authorization,
  }) {
    _dio.options.headers['Authorization'] = authorization;
  }

  //#endregion SETTER

  // GET request
  Future<Response<dynamic>> get(
      String url, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    ISentrySpan? transaction;
    ISentrySpan? span;
    if (StringConstants.sentryMonitorPath.any((String element) => url.contains(element))) {
      transaction = Sentry.startTransaction(
        url,
        'get',
        bindToScope: true,
      );
      span = transaction.startChild(
        'dio',
        description: 'GET $url',
      );
    }

    try {
      final response = await _dio.get<dynamic>(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      span?.status = const SpanStatus.ok();
      return response;
    } catch (e) {
      span
        ?..throwable = e
        ..status = const SpanStatus.internalError();
      // Sentry.captureException(e, stackTrace: s).ignore();
      rethrow;
    } finally {
      unawaited(span?.finish());
      unawaited(transaction?.finish());
    }
  }

  // POST request
  Future<Response<dynamic>> post(
      String url, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    final transaction = Sentry.startTransaction(
      url,
      'post',
      bindToScope: true,
    );
    final span = transaction.startChild(
      'dio',
      description: 'POST $url',
    );

    try {
      final response = await _dio.post<dynamic>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      span.status = const SpanStatus.ok();
      return response;
    } catch (e, s) {
      span
        ..throwable = e
        ..status = const SpanStatus.internalError();

      if (data is FormData) {
        span.setData('data', data.fields);
      } else {
        span.setData('data', data);
      }

      // Only send when response error is not 400 or 401
      if (e is DioException && !NumberConstants.sentryFilterHttpException.contains(e.response?.statusCode)) {
        Sentry.captureException(
          e,
          stackTrace: s,
          withScope: (scope) {
            if (data is FormData) {
              scope.setContexts('payload', {'data': data.fields});
            } else {
              scope.setContexts('payload', {'data': data});
            }
          },
        ).ignore();
      }
      rethrow;
    } finally {
      unawaited(span.finish());
      unawaited(transaction.finish());
    }
  }

  // PUT request
  Future<Response<dynamic>> put(
      String url, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    final transaction = Sentry.startTransaction(
      url,
      'put',
      bindToScope: true,
    );
    final span = transaction.startChild(
      'dio',
      description: 'PUT $url',
    );

    try {
      final response = await _dio.put<dynamic>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      span.status = const SpanStatus.ok();
      return response;
    } catch (e, s) {
      span
        ..throwable = e
        ..status = const SpanStatus.internalError();

      if (data is FormData) {
        span.setData('data', data.fields);
      } else {
        span.setData('data', data);
      }

      Sentry.captureException(e, stackTrace: s).ignore();
      rethrow;
    } finally {
      unawaited(span.finish());
      unawaited(transaction.finish());
    }
  }

  // DELETE request
  Future<Response<dynamic>> delete(
      String url, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    final transaction = Sentry.startTransaction(
      url,
      'delete',
      bindToScope: true,
    );
    final span = transaction.startChild(
      'dio',
      description: 'DELETE $url',
    );

    try {
      final response = await _dio.delete<dynamic>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      span.status = const SpanStatus.ok();
      return response;
    } catch (e, _) {
      span
        ..throwable = e
        ..status = const SpanStatus.internalError();
      // Sentry.captureException(e, stackTrace: s).ignore();
      rethrow;
    } finally {
      unawaited(span.finish());
      unawaited(transaction.finish());
    }
  }

  /// Downloads a file from the given [url] and saves it to [savePath].
  ///
  /// Optionally accepts [queryParameters], [options], [cancelToken], and [onReceiveProgress]
  /// for customizing the request and tracking download progress.
  ///
  /// The download operation is wrapped in a Sentry transaction and span for monitoring.
  /// If an error occurs, the span status is set to internal error and the exception is rethrown.
  ///
  /// Returns a [Response] containing the result of the download operation.
  Future<Response<dynamic>> download(
      String url,
      String savePath, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    final transaction = Sentry.startTransaction(
      url,
      'download',
      bindToScope: true,
    );
    final span = transaction.startChild(
      'dio',
      description: 'DOWNLOAD $url',
    );
    try {
      final response = await _dio.download(
        url,
        savePath,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      span.status = const SpanStatus.ok();
      return response;
    } catch (e, _) {
      span
        ..throwable = e
        ..status = const SpanStatus.internalError();
      // Sentry.captureException(e, stackTrace: s).ignore();
      rethrow;
    } finally {
      unawaited(span.finish());
      unawaited(transaction.finish());
    }
  }
}
