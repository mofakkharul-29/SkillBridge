abstract class AppExceptions implements Exception {
  final String code;
  final String message;
  final String userMessage;

  const AppExceptions({
    required this.code,
    required this.message,
    required this.userMessage,
  });

  @override
  String toString() => 'AppException($code): $message';
}
