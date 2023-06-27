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
        if (failure is TimeOutFailure) {
          setHomeStatus(Status.error);
        }
      },
    );
  }

// Response
  @observable
  DataModel? data;
  @action
  void setData(DataModel value) => data = value;
  @action
  void clearData() => data = null;

// States
  @observable
  Status homeStatus = Status.initial;

  @action
  void setHomeStatus(Status value) => homeStatus = value;
  // @observable
  // bool homeLoading = false;
  // @action
  // void setHomeLoading(bool value) => homeLoading = value;

  // @observable
  // String? homeError;
  // @action
  // void setHomeError(String value) => homeError = value;
  // @action
  // void clearHomeError() => homeError = null;
}

enum Status {
  initial,
  loading,
  success,
  error,
}
