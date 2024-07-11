import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:ansicolor/ansicolor.dart';
import 'package:base_clean_arch/core/configs/env/environment.dart';
import 'package:base_clean_arch/core/constants/number_constants.dart';
import 'package:base_clean_arch/core/constants/string_constants.dart';
import 'package:base_clean_arch/core/exceptions/server_exception.dart';
import 'package:base_clean_arch/core/services/interceptors/custom_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

class BaseApiClient {
  BaseApiClient();

  final Dio _dio = Dio();
  final talkerDioLogger = TalkerDioLogger(
    settings: TalkerDioLoggerSettings(
      printRequestHeaders: false,
      printResponseHeaders: false,
      printResponseMessage: true,
      requestPen: AnsiPen()..blue(),
      responsePen: AnsiPen()..rgb(r: 1.0, g: 0.5, b: 0.0),
    ),
  );
  final logInterceptor = LogInterceptor(
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
  CancelToken cancelToken = CancelToken();

  Future<String> get({required String pathUrl, Map<String, dynamic>? params, String? path, String? customHost}) async {
    _dio.options.headers['content-Type'] = StringConstants.httpApplicationJson;
    _dio.options.responseType = ResponseType.json;

    _dio.interceptors.clear();
    _dio.interceptors.add(CustomInterceptors());
    if (kDebugMode) {
      if (Platform.isIOS) {
        _dio.interceptors.add(logInterceptor);
      } else {
        _dio.interceptors.add(talkerDioLogger);
      }
    }

    pathUrl = (customHost ?? Environment.appHostUrl) + pathUrl;

    try {
      final Response<dynamic> res = await getGetResponse(pathUrl, params, path);
      return handleResponse(res);
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<void> cancelRequest() async {
    return;
  }

  Future<List<int>> getBytes({required String pathUrl, Map<String, dynamic>? params, String? path, String? customHost}) async {
    _dio.options.headers['content-Type'] = StringConstants.httpApplicationJson;
    _dio.options.responseType = ResponseType.bytes;

    _dio.interceptors.clear();
    _dio.interceptors.add(CustomInterceptors());
    if (kDebugMode) {
      if (Platform.isIOS) {
        _dio.interceptors.add(logInterceptor);
      } else {
        _dio.interceptors.add(talkerDioLogger);
      }
    }

    pathUrl = (customHost ?? Environment.appHostUrl) + pathUrl;

    try {
      final Response<dynamic> res = await getGetResponse(pathUrl, params, path);
      return res.data as List<int>;
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<String> post({required String pathUrl, Map<String, dynamic>? jsonBody, bool isTelegram = false, String? customHost}) async {
    _dio.options.headers['content-Type'] = StringConstants.httpApplicationJson;

    _dio.interceptors.clear();
    _dio.interceptors.add(CustomInterceptors());
    if (kDebugMode) {
      if (Platform.isIOS) {
        _dio.interceptors.add(logInterceptor);
      } else {
        _dio.interceptors.add(talkerDioLogger);
      }
    }

    if (!isTelegram) {
      pathUrl = (customHost ?? Environment.appHostUrl) + pathUrl;
    } else {
      pathUrl = Environment.appHostTelegramUrl + pathUrl;
    }

    try {
      final Response<dynamic> res = await getPostResponse(pathUrl, jsonBody);

      return handleResponse(res);
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<String> put({required String pathUrl, Map<String, dynamic>? jsonBody, String? customHost}) async {
    _dio.options.headers['content-Type'] = StringConstants.httpApplicationJson;

    _dio.interceptors.clear();
    _dio.interceptors.add(CustomInterceptors());
    if (kDebugMode) {
      if (Platform.isIOS) {
        _dio.interceptors.add(logInterceptor);
      } else {
        _dio.interceptors.add(talkerDioLogger);
      }
    }

    pathUrl = (customHost ?? Environment.appHostUrl) + pathUrl;

    try {
      final Response<dynamic> res = await getPutResponse(pathUrl, jsonBody);

      return handleResponse(res);
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<Response<dynamic>> getGetResponse(String pathUrl, Map<String, dynamic>? params, String? path) async {
    if (params != null) {
      return await _dio.get(
        pathUrl,
        queryParameters: params,
        cancelToken: cancelToken,
      );
    } else {
      if (path != null) {
        return await _dio.get(pathUrl + path);
      } else {
        return await _dio.get(pathUrl, cancelToken: cancelToken);
      }
    }
  }

  Future<Response<dynamic>> getPostResponse(String pathUrl, Map<String, dynamic>? jsonBody) async {
    if (jsonBody != null) {
      return await _dio.post(pathUrl, data: jsonBody, cancelToken: cancelToken);
    } else {
      return await _dio.post(pathUrl, cancelToken: cancelToken);
    }
  }

  Future<Response<dynamic>> getPutResponse(String pathUrl, Map<String, dynamic>? jsonBody) async {
    if (jsonBody != null) {
      return await _dio.put(pathUrl, data: jsonBody, cancelToken: cancelToken);
    } else {
      return await _dio.put(pathUrl, cancelToken: cancelToken);
    }
  }

  Future<String> handleResponse(Response<dynamic> res) async {
    Map<String, dynamic> response = <String, dynamic>{};
    String encoded = '';
    try {
      if (res.toString() == '[]') {
        Map<String, dynamic> map = {'data': jsonDecode(res.toString()) as List<dynamic>};
        response = map;
        encoded = jsonEncode(response);
      } else {
        response = jsonDecode(res.toString());
        encoded = jsonEncode(response);
      }
    } on FormatException catch (_) {
      Map<String, dynamic> map = {'data': res.data as List<dynamic>};
      response = map;
      encoded = jsonEncode(response);
    }

    if (NumberConstants.httpStatusOk.contains(res.statusCode)) {
      return encoded.toString();
    } else {
      throw ServerException(message: response['code']);
    }
  }

  Object handleError(Object error) {
    try {
      if (error is DioException) {
        final Map<String, dynamic> response = error.response != null
            ? error.response?.statusCode == NumberConstants.httpToManyRequest
                ? {'code': 'Terjadi kesalahan pada server, Harap coba lagi beberapa saat'}
                : jsonDecode(error.response.toString())
            : error.type == DioExceptionType.unknown
                ? {
                    'code': 'Tidak ada koneksi internet',
                    'message': error.message,
                  }
                : {
                    'code': 'Terjadi kesalahan',
                    'message': error.message,
                  };
        if (error.type == DioExceptionType.connectionTimeout || error.type == DioExceptionType.receiveTimeout) {
          throw ServerException(
            message: '408',
            code: 408,
            path: error.requestOptions.path,
            messageString: error.message,
          );
        } else {
          throw ServerException(
            message: response['code'] ?? 'Terjadi kesalahan',
            code: response['statusCode'],
            path: error.requestOptions.path,
            messageString: response['message'],
            attributes: response['attributes'],
          );
        }
      } else {
        throw ServerException(message: 'Terjadi Kesalahan');
      }
    } catch (e) {
      if (e is ServerException) {
        rethrow;
      } else {
        throw ServerException(message: 'Terjadi Kesalahan');
      }
    }
  }
}
