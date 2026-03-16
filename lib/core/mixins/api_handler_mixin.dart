import 'package:base_clean_arch/core/constants/number_constants.dart';
import 'package:base_clean_arch/core/exceptions/server_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

mixin ApiHandlerMixin {
  Future<T> handleApiResponse<T>(Future<Response> apiCall) async {
    try {
      final response = await apiCall;
      try {
        if (response.statusCode == 200 || response.statusCode == 201) {
          final data = response.data as T;
          return data;
        } else {
          throw ServerException(
            message: (response.data as Map<String, dynamic>)['message'] as String,
            code: response.statusCode,
          );
        }
      } on FormatException catch (e) {
        if (kDebugMode) {
          print('FormatException: $e');
        }
        if (T is Map<String, dynamic>) {
          return {
            'data': response.data as List<dynamic>,
          } as T;
        } else {
          rethrow;
        }
      } on TypeError catch (e) {
        if (kDebugMode) {
          print('TypeError: $e');
        }
        return {
          'data': response.data as List<dynamic>,
        } as T;
      } catch (e) {
        if (kDebugMode) {
          print('Unknown error: $e');
        }

        if (e is ServerException) {
          rethrow;
        }

        return {
          'data': response.data as List<dynamic>,
        } as T;
      }
    } on DioException catch (error) {
      final Map<String, dynamic> response;
      if (error.type == DioExceptionType.connectionTimeout || error.type == DioExceptionType.receiveTimeout) {
        throw ServerException(
          message: '408',
          code: 408,
          path: error.requestOptions.path,
          messageString: error.message,
        );
      } else {
        if (error.response != null) {
          if (error.response?.statusCode == NumberConstants.httpToManyRequest) {
            response = {'code': 'Terjadi kesalahan pada server, Harap coba lagi beberapa saat'};
          } else {
            response = (error.response?.data as Map<String, dynamic>?) ??
                <String, dynamic>{
                  'code': 'Terjadi kesalahan pada server',
                  'message': error.message,
                };
          }
        } else if (error.type == DioExceptionType.unknown) {
          response = {
            'code': 'Tidak ada koneksi internet',
            'message': error.message,
          };
        } else {
          response = {
            'code': 'Terjadi kesalahan',
            'message': error.message,
          };
        }

        throw ServerException(
          message: response['code'] ?? 'Terjadi kesalahan',
          code: response['statusCode'],
          path: error.requestOptions.path,
          messageString: response['message'],
          attributes: response['attributes'],
        );
      }
    }
  }
}
