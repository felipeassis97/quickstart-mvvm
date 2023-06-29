import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:quickstart_mvvm/app/app_widget.dart';
import 'package:quickstart_mvvm/app/services/service_locator/service_locator.dart';

void main() async {
  await setupLibraries();
  runApp(MyApp());
}

Future<void> setupLibraries() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //Environment variables (.env)
  await dotenv.load();

  //Service locator
  ServiceLocator.init();
}
