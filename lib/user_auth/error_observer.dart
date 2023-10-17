class ErrorObserver {
  String errorMessage = '';

  void setError(String message) {
    errorMessage = message;
  }

  String getError() {
    return errorMessage;
  }
}
