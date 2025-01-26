class ParseErrorLogger {
  void log(String message) {
    print("ParseError: $message");
  }
  void logError(Object? error, StackTrace? stackTrace, [dynamic options]) {
    // Log the error (optional)
    print("Error: $error");
    if (stackTrace != null) {
      print("StackTrace: $stackTrace");
    }
    if (options != null) {
      print("Options: $options");
    }
  }
}
