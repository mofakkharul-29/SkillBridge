import 'app_exceptions.dart';

class AuthException extends AppException {
  const AuthException({
    required super.code,
    required super.message,
    required super.userMessage,
  });

  factory AuthException.emailAlreadyInUse() => const AuthException(
    code: 'email-already-in-use',
    message: 'Email is already registered.',
    userMessage: 'This email is already in use. Try logging in instead.',
  );

  factory AuthException.invalidCredential() => const AuthException(
    code: 'invalid-credential',
    message: 'Invalid email or password.',
    userMessage: 'Incorrect email or password. Please try again.',
  );

  factory AuthException.userNotFound() => const AuthException(
    code: 'user-not-found',
    message: 'No user found for this email.',
    userMessage: 'No account found with this email.',
  );

  factory AuthException.weakPassword() => const AuthException(
    code: 'weak-password',
    message: 'Password is too weak.',
    userMessage: 'Please use a stronger password.',
  );

  factory AuthException.networkError() => const AuthException(
    code: 'network-request-failed',
    message: 'Network request failed.',
    userMessage: 'No internet connection. Please check your network.',
  );

  factory AuthException.userCreationFailed() => const AuthException(
    code: 'user-creation-failed',
    message: 'Failed to create account',
    userMessage: 'Account creation failed. Please try again.',
  );

  factory AuthException.unknown(String code) => AuthException(
    code: code,
    message: 'Unknown auth error: $code',
    userMessage: 'Something went wrong. Please try again.',
  );
}
