import 'package:flutter_dotenv/flutter_dotenv.dart';

class APICallConstantExample {
  Future<String> API_BASE_URL() async {
    return dotenv.env['NOMABE_API_URL'] ?? '';
  }
  Future<String> API_AUTH_BEARER() async {
    return dotenv.env['NOMABE_API_KEY'] ?? '';
  }
  Future<String> API_HEADER() async {
    return dotenv.env['NOMABE_API_HEADER'] ?? '';
  }
  Future<String?> GEMINI_AUTH_KEY() async {
    return dotenv.env['GEMINI_API_KEY'] ?? '';
  }
}
