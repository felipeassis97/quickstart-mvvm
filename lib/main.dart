import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quickstart_mvvm/app/app_widget.dart';
import 'package:quickstart_mvvm/app/services/service_locator/service_locator.dart';

void main() async {
  await setupLibraries();
  runApp(const MyApp());
}

Future<void> setupLibraries() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Environment variables (.env)
  await dotenv.load();

  //Service locator
  ServiceLocator.init();
}
