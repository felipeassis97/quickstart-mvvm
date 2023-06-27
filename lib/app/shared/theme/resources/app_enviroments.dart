import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AppEnviroments {
  static String apiUrl = dotenv.get('HOST_API', fallback: '');
}
