import 'package:skill_bridge/core/exceptions/app_exceptions.dart';

class UserRepoException extends AppExceptions {
  UserRepoException({required super.code, required super.message})
    : super(userMessage: _toUserMessage(code));

  static String _toUserMessage(String code) {
    switch (code) {
      case 'user-not-found':
        return 'User account not found.';
      case 'permission-denied':
        return 'You do not have permission to do this.';
      case 'unavailable':
        return 'Service unavailable. Please check your connection.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }
}
