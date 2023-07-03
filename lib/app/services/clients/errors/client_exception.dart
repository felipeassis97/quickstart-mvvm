import 'package:dio/dio.dart';

final class ClientException implements Exception {
  final String? message;
  final int? statusCode;
  final dynamic data;
  final Object? error;
  final StackTrace? stackTrace;
  final RequestOptions? requestOptions;
  final ApiExceptionType? type;
  final Response<dynamic>? response;

  ClientException({
    this.message,
    this.statusCode,
    this.data,
    this.error,
    this.stackTrace,
    this.requestOptions,
    this.type,
    this.response,
  });

  factory ClientException.fromDioResponse(Response response) {
    return ClientException(
        data: response.data,
        requestOptions: response.requestOptions,
        statusCode: response.statusCode,
        message: response.statusMessage);
  }

  factory ClientException.fromDioException(DioException response) {
    return ClientException(
      error: response.error,
      requestOptions: response.requestOptions,
      message: response.message,
      type: parseException(response.type),
      stackTrace: response.stackTrace,
      response: response.response,
    );
  }

  static ApiExceptionType parseException(DioExceptionType? exception) {
    switch (exception) {
      case DioExceptionType.connectionTimeout:
        return ApiExceptionType.connectionTimeout;
      case DioExceptionType.sendTimeout:
        return ApiExceptionType.sendTimeout;
      case DioExceptionType.receiveTimeout:
        return ApiExceptionType.receiveTimeout;
      case DioExceptionType.badCertificate:
        return ApiExceptionType.badCertificate;
      case DioExceptionType.badResponse:
        return ApiExceptionType.badResponse;
      case DioExceptionType.cancel:
        return ApiExceptionType.cancel;
      case DioExceptionType.connectionError:
        return ApiExceptionType.connectionError;
      default:
        return ApiExceptionType.unknown;
    }
  }
}

enum ApiExceptionType {
  connectionTimeout,
  sendTimeout,
  receiveTimeout,
  badCertificate,
  badResponse,
  cancel,
  connectionError,
  unknown,
}
