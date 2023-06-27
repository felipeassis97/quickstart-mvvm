import 'package:quickstart_mvvm/app/features/home/data/repositories/fetch_data_repository.dart';
import 'package:quickstart_mvvm/app/features/home/data/repositories/fetch_data_repository_impl.dart';
import 'package:quickstart_mvvm/app/features/home/ui/viewmodels/home_viewmodel.dart';
import 'package:quickstart_mvvm/app/services/clients/api_client/api_client.dart';
import 'package:quickstart_mvvm/app/services/service_locator/service_locator.dart';

class HomeServiceLocator {
  static final locator = ServiceLocator.locator;

  static void init() {
    //Repository
    locator.registerFactory<FetchDataRepository>(
      () => FetchDataRepositoryImpl(client: locator<ApiClient>()),
    );

    //ViewModels
    locator.registerSingleton<HomeViewModel>(
      HomeViewModel(repository: locator<FetchDataRepository>()),
    );
  }
}
