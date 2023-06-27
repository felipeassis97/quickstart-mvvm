import 'package:quickstart_mvvm/app/features/home/data/models/data_model.dart';
import 'package:quickstart_mvvm/app/features/home/data/repositories/fetch_data_repository.dart';
import 'package:quickstart_mvvm/app/services/clients/api_client/api_client.dart';
import 'package:quickstart_mvvm/app/services/clients/errors/app_exceptions.dart';
import 'package:quickstart_mvvm/app/services/clients/errors/client_exception.dart';
import 'package:result_dart/result_dart.dart';

class FetchDataRepositoryImpl implements FetchDataRepository {
  FetchDataRepositoryImpl({
    required this.client, // required this.errorLog
  });
  final ApiClient client;

  @override
  AsyncResult<DataModel, AppFailure> getData() async {
    try {
      final result =
          await client.get('https://jsonplaceholder.typicode.com/todos/2');
      return Success(DataModel.fromJson(result.data));
    } on ClientException catch (e) {
      if (e.type == ApiExceptionType.connectionTimeout) {
        return Failure(TimeOutFailure());
      }
      switch (e.statusCode) {
        case 400:
          return Failure(BadRequestFailure());
        case 401:
          return Failure(UnauthorizedFailure());
        case 404:
          return Failure(NotFoundFailure());
        case 500:
          return Failure(InternalServerErrorFailure());
        case 503:
          return Failure(ServiceUnavailableFailure());
      }
      return Failure(UnknownErrorFailure());
    }
  }
}
