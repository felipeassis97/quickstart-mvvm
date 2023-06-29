import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_mvvm/app/features/home/data/models/data_model.dart';
import 'package:quickstart_mvvm/app/features/home/data/repositories/fetch_data_repository.dart';
import 'package:quickstart_mvvm/app/features/home/data/repositories/fetch_data_repository_impl.dart';
import 'package:quickstart_mvvm/app/services/clients/api_client/api_client.dart';
import 'package:quickstart_mvvm/app/services/clients/api_client/api_response.dart';
import 'package:quickstart_mvvm/app/services/clients/errors/app_exceptions.dart';
import 'package:quickstart_mvvm/app/services/clients/errors/client_exception.dart';
import 'package:quickstart_mvvm/app/services/event_log/crashlytics/error_log_service.dart';
import 'package:quickstart_mvvm/app/services/event_log/crashlytics/error_log_service_impl.dart';
import 'package:result_dart/result_dart.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  late FetchDataRepository repository;
  late MockApiClient mockApiClient;
  late ErrorLogService mockErrorLog;

  setUp(() {
    mockApiClient = MockApiClient();
    mockErrorLog = ErrorLogServiceImpl();
    repository =
        FetchDataRepositoryImpl(client: mockApiClient, log: mockErrorLog);
  });

  test('getData should return Success when client returns valid data',
      () async {
    // Arrange
    final responseData = {
      'userId': 1,
      'id': 1,
      'title': 'delectus aut autem',
      'completed': false
    };
    final response = ApiResponse(
      statusCode: 200,
      data: responseData,
      message: 'Success',
    );

    when(() =>
            mockApiClient.get('https://jsonplaceholder.typicode.com/todos/2'))
        .thenAnswer(
      (_) async => response,
    );

    // Assert
    final result = await repository.getData();
    expect(result.isSuccess(), true);
    expect(result, isA<Result<DataModel, AppFailure>>());
  });

  test(
      'getData should return TimeOutFailure when client throws ClientException with connectionTimeout',
      () async {
    // Arrange
    final exception = ClientException(
      type: ApiExceptionType.connectionTimeout,
      message: 'Connection Timeout',
    );
    when(() =>
            mockApiClient.get('https://jsonplaceholder.typicode.com/todos/2'))
        .thenThrow(exception);

    // Assert
    final result = await repository.getData();
    expect(result.isError(), true);
  });
}
