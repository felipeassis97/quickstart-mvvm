abstract class ErrorLogService {
  Future<void> error({
    dynamic data,
    int? statusCode,
    String? message,
    String? local,
  });
  Future<void> log(String message);
}
