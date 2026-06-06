import 'package:skill_bridge/core/exceptions/app_exceptions.dart';

class AuthRepoException extends AppExceptions {
  AuthRepoException({required super.code, required super.message})
    : super(userMessage: _toUserMessage(code));

  static String _toUserMessage(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No user found for that email.';

      case 'wrong-password':
        return 'Wrong password provided for that user.';

      case 'invalid-credential':
        return 'Invalid email or password.';

      default:
        return 'Something went wrong. Please try again.';
    }
  }
}
