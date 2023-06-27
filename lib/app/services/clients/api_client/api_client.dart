import 'package:quickstart_mvvm/app/services/clients/api_client/api_response.dart';

abstract class ApiClient {
  Future<ApiResponse> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  });

  Future<ApiResponse> post(
    String path, {
    Map<String, String> headers,
    dynamic body,
  });
}
