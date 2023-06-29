import 'package:mobx/mobx.dart';
import 'package:quickstart_mvvm/app/features/home/data/models/data_model.dart';
import 'package:quickstart_mvvm/app/features/home/data/repositories/fetch_data_repository.dart';
import 'package:quickstart_mvvm/app/services/clients/errors/app_exceptions.dart';
part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  final FetchDataRepository repository;
  _HomeViewModelBase({required this.repository});

  Future<void> getData() async {
    setHomeStatus(Status.loading);
    final result = await repository.getData();

    result.fold(
      (success) {
        setHomeStatus(Status.success);
        setData(success);
      },
      (failure) {
        setHomeStatus(Status.error);
        if (failure is ApiUnknownErrorFailure) {
          setHomeError('$failure | Error: ${failure.exception?.error}');
        } else {
          setHomeError('$failure');
        }
      },
    );
  }

// Response
  @observable
  ObservableList<DataModel> data = ObservableList();
  @action
  void setData(List<DataModel> value) => data.addAll(value);

  @action
  void clearData() => data.clear();

// States
  @observable
  Status homeStatus = Status.initial;

  @action
  void setHomeStatus(Status value) => homeStatus = value;

  @observable
  String? homeError;
  @action
  void setHomeError(String value) => homeError = value;
  @action
  void clearHomeError() => homeError = null;
}

enum Status {
  initial,
  loading,
  success,
  error,
}
