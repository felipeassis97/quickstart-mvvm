import 'package:dio/dio.dart';

final class ApiResponse {
  final String? message;
  final int? statusCode;
  final dynamic data;
  final Object? error;
  final StackTrace? stackTrace;
  final RequestOptions? requestOptions;
  final DioExceptionType? type;
  final Response<dynamic>? response;

  const ApiResponse(
      {this.response,
      this.statusCode,
      this.data,
      this.message,
      this.error,
      this.stackTrace,
      this.requestOptions,
      this.type});

  factory ApiResponse.fromDioResponse(Response response) {
    return ApiResponse(
        data: response.data,
        requestOptions: response.requestOptions,
        statusCode: response.statusCode,
        message: response.statusMessage);
  }

  factory ApiResponse.fromDioException(DioException response) {
    return ApiResponse(
      error: response.error,
      requestOptions: response.requestOptions,
      message: response.message,
      type: response.type,
      stackTrace: response.stackTrace,
      response: response.response,
    );
  }
}
