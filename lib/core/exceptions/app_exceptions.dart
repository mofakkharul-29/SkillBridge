abstract class AppException implements Exception {
  final String code;
  final String message;
  final String userMessage;

  const AppException({
    required this.code,
    required this.message,
    required this.userMessage,
  });

  @override
  String toString() => 'Error($code): $message';
}
