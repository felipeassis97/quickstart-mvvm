import 'package:quickstart_mvvm/app/services/event_log/crashlytics/error_log_service.dart';

class ErrorLogServiceImpl implements ErrorLogService {
  @override
  Future<void> error({
    dynamic data,
    int? statusCode,
    String? message,
    String? local,
  }) {
    // TODO: implement error
    throw UnimplementedError();
  }

  @override
  Future<void> log(String message) {
    // TODO: implement log
    throw UnimplementedError();
  }
}
