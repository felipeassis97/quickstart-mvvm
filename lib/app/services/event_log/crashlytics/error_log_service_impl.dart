import 'dart:developer';
import 'package:quickstart_mvvm/app/services/event_log/crashlytics/error_log_service.dart';

class ErrorLogServiceImpl implements ErrorLogService {
  @override
  Future<void> registerError({
    Object? error,
    dynamic data,
    int? statusCode,
    String? message,
    String? path,
    String? local,
  }) async {
    log('',
        error:
            '[$local] - $path | status code: $statusCode | message: $message');
  }

  @override
  Future<void> registerLog(String message) async {
    log('LOG: $message');
  }
}
