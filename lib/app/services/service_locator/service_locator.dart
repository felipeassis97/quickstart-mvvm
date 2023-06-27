import 'package:get_it/get_it.dart';
import 'package:quickstart_mvvm/app/services/service_locator/home_service_locator.dart';
import 'package:quickstart_mvvm/app/services/service_locator/main_service_locator.dart';

class ServiceLocator {
  static final GetIt locator = GetIt.instance;

  static void init() {
    MainServiceLocator.init();
    HomeServiceLocator.init();
  }
}
