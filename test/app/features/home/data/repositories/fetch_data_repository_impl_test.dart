import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_mvvm/app/features/home/data/models/data_model.dart';
import 'package:quickstart_mvvm/app/features/home/data/repositories/fetch_data_repository_impl.dart';
import 'package:quickstart_mvvm/app/services/clients/api_client/api_client.dart';
import 'package:quickstart_mvvm/app/services/clients/api_client/api_response.dart';
import 'package:quickstart_mvvm/app/services/clients/errors/app_exceptions.dart';
import 'package:quickstart_mvvm/app/services/clients/errors/client_exception.dart';
import 'package:result_dart/result_dart.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  late FetchDataRepositoryImpl repository;
  late MockApiClient mockApiClient;

  setUp(() {
    // Inicialize as instâncias necessárias para cada teste
    mockApiClient = MockApiClient();
    repository = FetchDataRepositoryImpl(client: mockApiClient);
  });

  test('getData should return Success when client returns valid data',
      () async {
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

    // Chame o método sendo testado
    final result = await repository.getData();

    // Verifique se o resultado é do tipo Success e contém os dados esperados
    expect(result.isSuccess(), true);
    expect(result, isA<Result<DataModel, AppFailure>>());
  });

  test(
      'getData should return TimeOutFailure when client throws ClientException with connectionTimeout',
      () async {
    // Defina o comportamento esperado do mockApiClient
    final exception = ClientException(
      type: ApiExceptionType.connectionTimeout,
      message: 'Connection Timeout',
    );
    when(() =>
            mockApiClient.get('https://jsonplaceholder.typicode.com/todos/2'))
        .thenThrow(exception);

    // Chame o método sendo testado
    final result = await repository.getData();

    // Verifique se o resultado é do tipo Failure e contém a falha esperada
    expect(result.isError(), true);
  });
}
