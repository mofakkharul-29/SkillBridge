class ValidateHelper {
  static String? validateName(String name) {
    if (name.isEmpty) {
      return 'Name is required';
    }
    if (name.length <= 2) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  static String? validatePassword(String pass) {
    if (pass.isEmpty) {
      return 'Password can\'t be empty';
    }

    final minLength = RegExp(r'.{6,}');
    if (!minLength.hasMatch(pass)) {
      return 'Password must be at least 6 characters';
    }

    final uppercase = RegExp(r'[A-Z]');
    if (!uppercase.hasMatch(pass)) {
      return 'At least one uppercase letter';
    }

    final lowercase = RegExp(r'[a-z]');
    if (!lowercase.hasMatch(pass)) {
      return 'At least one lowercase letter';
    }

    final digit = RegExp(r'[0-9]');
    if (!digit.hasMatch(pass)) {
      return 'At least one numeric digit';
    }

    final special = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    if (!special.hasMatch(pass)) {
      return 'At least one special character';
    }

    return null;
  }

  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email is required';
    } else {
      final emailReg = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );
      if (!emailReg.hasMatch(email)) {
        return 'Enter a valid email';
      }
    }
    return null;
  }

  static String? validateConfirmPassword({
    required String prevPass,
    required String? curPass,
  }) {
    if (prevPass != curPass) {
      return 'Password not matched';
    }
    return null;
  }
}
