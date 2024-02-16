class APICallConstantExample {
  //Rename the file, removing the 'Example' from the class name and file name
  APICallConstantExample._();
  static const String API_BASE_URL = String.fromEnvironment('NOMABE_API_URL');
  static const String API_AUTH_BEARER =
      String.fromEnvironment('NOMABE_API_KEY');
  static const String API_HEADER = String.fromEnvironment('NOMABE_API_HEADER');
  static const String GEMINI_AUTH_KEY =
      String.fromEnvironment('GEMINI_API_KEY');
}
