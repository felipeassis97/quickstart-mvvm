import 'package:flutter_dotenv/flutter_dotenv.dart';

final class AppEnviroments {
  static String apiUrl = dotenv.get('HOST_API', fallback: '');
}
