import 'package:quickstart_mvvm/app/features/home/data/models/data_model.dart';
import 'package:quickstart_mvvm/app/services/clients/errors/app_exceptions.dart';
import 'package:result_dart/result_dart.dart';

abstract class FetchDataRepository {
  AsyncResult<DataModel, AppFailure> getData();
}
