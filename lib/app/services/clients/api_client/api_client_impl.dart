import 'package:dio/dio.dart';
import 'package:quickstart_mvvm/app/services/clients/api_client/api_client.dart';
import 'package:quickstart_mvvm/app/services/clients/api_client/api_response.dart';
import 'package:quickstart_mvvm/app/services/clients/errors/client_exception.dart';

class ApiClientImpl implements ApiClient {
  const ApiClientImpl({required this.client});
  final Dio client;

  @override
  Future<ApiResponse> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await client.get(
        path,
        options: Options(
          headers: headers,
          validateStatus: (status) =>
              status != null && (status >= 200 && status <= 599),
        ),
      );

      if (response.statusCode != 200) {
        throw ClientException.fromDioResponse(response);
      }
      return ApiResponse.fromDioResponse(response);
    } on DioException catch (e) {
      throw ClientException.fromDioException(e);
    } on Exception catch (e) {
      throw ClientException(error: e);
    }
  }

  @override
  Future<ApiResponse> post(
    String path, {
    Map<String, String> headers = const <String, String>{},
    dynamic body = const <String, String>{},
  }) async {
    try {
      final response = await client.post(
        path,
        data: body,
        options: Options(
          headers: headers,
          validateStatus: (status) =>
              status != null && (status >= 200 && status <= 599),
        ),
      );
      if (response.statusCode != 201) {
        throw ClientException.fromDioResponse(response);
      }
      return ApiResponse.fromDioResponse(response);
    } on DioException catch (e) {
      throw ClientException.fromDioException(e);
    } on Exception catch (e) {
      throw ClientException(error: e);
    }
  }
}
