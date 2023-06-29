abstract class ErrorLogService {
  Future<void> registerError({
    Object? error,
    dynamic data,
    int? statusCode,
    String? message,
    String? path,
    String? local,
  });
  Future<void> registerLog(String message);
}
