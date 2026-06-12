const Object _undefined = Object();

class AuthFormState {
  final String? nameError;
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;
  final String? phoneError;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  final bool isLoading;
  final bool isLogin;
  final bool isValid;

  const AuthFormState({
    this.nameError,
    this.emailError,
    this.passwordError,
    this.confirmPasswordError,
    this.phoneError,
    this.isPasswordVisible = false,
    this.isConfirmPasswordVisible = false,
    this.isLoading = false,
    this.isLogin = false,
    this.isValid = false,
  });

  AuthFormState copyWith({
    Object? nameError = _undefined,
    Object? emailError = _undefined,
    Object? passwordError = _undefined,
    Object? confirmPasswordError = _undefined,
    Object? phoneError = _undefined,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
    bool? isLoading,
    bool? isLogin,
    bool? isValid,
  }) {
    return AuthFormState(
      nameError: nameError == _undefined
          ? this.nameError
          : nameError as String?,
      emailError: emailError == _undefined
          ? this.emailError
          : emailError as String?,
      passwordError: passwordError == _undefined
          ? this.passwordError
          : passwordError as String?,
      confirmPasswordError: confirmPasswordError == _undefined
          ? this.confirmPasswordError
          : confirmPasswordError as String?,
      phoneError: phoneError == _undefined
          ? this.phoneError
          : phoneError as String?,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
      isLoading: isLoading ?? this.isLoading,
      isLogin: isLogin ?? this.isLogin,
      isValid: isValid ?? this.isValid,
    );
  }

  factory AuthFormState.initial() => const AuthFormState();
}
