import 'package:skill_bridge/core/exceptions/app_exceptions.dart';

class AuthRepoException extends AppExceptions {
  AuthRepoException({required super.code, required super.message})
    : super(userMessage: _toUserMessage(code));

  static String _toUserMessage(String code) {
    switch (code) {
      // ── Registration ────────────────────────────
      case 'email-already-in-use':
        return 'An account already exists with this email.';
      case 'weak-password':
        return 'Password is too weak. Please choose a stronger one.';
      case 'operation-not-allowed':
        return 'Email and password sign-in is currently disabled.';

      // ── Login ────────────────────────────────────
      case 'user-not-found':
        return 'No account found with this email.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'invalid-credential':
        return 'Invalid email or password.';
      case 'user-disabled':
        return 'This account has been disabled. Please contact support.';

      // ── Both flows ───────────────────────────────
      case 'network-request-failed':
        return 'No internet connection. Please check your network.';
      case 'too-many-requests':
        return 'Too many attempts. Please wait a moment and try again.';

      // ── Google Sign In ───────────────────────────
      case 'id-token-missing':
        return 'Google sign-in failed. Please try again.';
      case 'firebase-user-null':
        return 'Sign-in failed. Please try again.';

      // ── Account ──────────────────────────────────
      case 'no-current-user':
        return 'No active session found. Please log in again.';
      case 'requires-recent-login':
        return 'For security, please log in again before deleting your account.';

      // ── Fallback ─────────────────────────────────
      default:
        return 'Something went wrong. Please try again.';
    }
  }
}
