import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quickstart_mvvm/app/services/clients/api_client/api_client.dart';
import 'package:quickstart_mvvm/app/services/clients/api_client/api_client_impl.dart';
import 'package:quickstart_mvvm/app/services/event_log/crashlytics/error_log_service.dart';
import 'package:quickstart_mvvm/app/services/event_log/crashlytics/error_log_service_impl.dart';
import 'package:quickstart_mvvm/app/services/service_locator/service_locator.dart';

final class MainServiceLocator {
  static final locator = ServiceLocator.locator;

  static void init() {
    //Flutter secure storage
    locator.registerFactory<FlutterSecureStorage>(
      () => const FlutterSecureStorage(),
    );

    // API Client
    locator.registerFactory<Dio>(
      () {
        final dio = Dio(BaseOptions(
          connectTimeout: const Duration(seconds: 90),
          receiveTimeout: const Duration(seconds: 90),
          sendTimeout: const Duration(seconds: 90),
        ));
        return dio;
      },
    );

    locator.registerFactory<ApiClient>(
      () => ApiClientImpl(
        client: locator<Dio>(),
      ),
    );

    locator.registerFactory<ErrorLogService>(
      () => ErrorLogServiceImpl(),
    );
  }
}
