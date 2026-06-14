import 'app_exceptions.dart';

class UserException extends AppException {
  const UserException({
    required super.code,
    required super.message,
    required super.userMessage,
  });

  factory UserException.notFound() => const UserException(
    code: 'user-not-found',
    message: 'User document does not exist in DB',
    userMessage: 'User data not found. Please contact support.',
  );

  factory UserException.writeFailed() => const UserException(
    code: 'write-failed',
    message: 'Failed to write user to Firestore.',
    userMessage: 'Could not save your data. Please try again.',
  );

  factory UserException.networkError() => const UserException(
    code: 'network-error',
    message: 'Firestore network request failed.',
    userMessage: 'No internet connection. Please check your network.',
  );

  factory UserException.unknown(String code) => UserException(
    code: code,
    message: 'Unknown Firestore error: $code',
    userMessage: 'Something went wrong. Please try again.',
  );
}
