import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_bridge/feature/auth/data/auth_form_state.dart';
import 'package:skill_bridge/feature/auth/widget/validate_helper.dart';

class AuthFormNotifier extends Notifier<AuthFormState> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passController;
  late final TextEditingController _confirmPassController;

  late final FocusNode _nameFocus;
  late final FocusNode _emailFocus;
  late final FocusNode _passFocus;
  late final FocusNode _confirmPassFocus;

  @override
  AuthFormState build() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passController = TextEditingController();
    _confirmPassController = TextEditingController();
    _nameFocus = FocusNode();
    _emailFocus = FocusNode();
    _passFocus = FocusNode();
    _confirmPassFocus = FocusNode();

    ref.onDispose(() {
      _nameController.dispose();
      _emailController.dispose();
      _passController.dispose();
      _confirmPassController.dispose();
      _nameFocus.dispose();
      _emailFocus.dispose();
      _passFocus.dispose();
      _confirmPassFocus.dispose();
    });

    return AuthFormState();
  }

  void validateName(String name) {
    state = state.copyWith(nameError: ValidateHelper.validateName(name));
  }

  void validateEmail(String email) {
    state = state.copyWith(emailError: ValidateHelper.validateEmail(email));
  }

  void validatePassword(String password) {
    state = state.copyWith(
      passwordError: ValidateHelper.validatePassword(password),
    );
  }

  void validateConfirmPassword(String conPassword) {
    state = state.copyWith(
      confirmPasswordError: ValidateHelper.validateConfirmPassword(
        prevPass: _passController.text,
        curPass: conPassword,
      ),
    );
  }

  void validateForm() {
    final nameError = state.isLogin
        ? null
        : ValidateHelper.validateName(_nameController.text);
    final emailError = ValidateHelper.validateEmail(_emailController.text);
    final passwordError = ValidateHelper.validatePassword(_passController.text);
    final confirmPasswordError = state.isLogin
        ? null
        : ValidateHelper.validateConfirmPassword(
            prevPass: _passController.text,
            curPass: _confirmPassController.text,
          );

    final isFormValid =
        nameError == null &&
        emailError == null &&
        passwordError == null &&
        confirmPasswordError == null;

    state = state.copyWith(
      nameError: nameError,
      emailError: emailError,
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
      isValid: isFormValid,
    );
  }

  void onLoginToggle() {
    _nameController.clear();
    _emailController.clear();
    _passController.clear();
    _confirmPassController.clear();
    _nameFocus.unfocus();
    _emailFocus.unfocus();
    _passFocus.unfocus();
    _confirmPassFocus.unfocus();

    final currentMode = state.isLogin;
    state = AuthFormState.initial().copyWith(isLogin: !currentMode);
  }

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  void toggleConfirmPasswordVisibility() {
    state = state.copyWith(
      isConfirmPasswordVisible: !state.isConfirmPasswordVisible,
    );
  }

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passController => _passController;
  TextEditingController get confirmPassController => _confirmPassController;

  FocusNode get nameFocus => _nameFocus;
  FocusNode get emailFocus => _emailFocus;
  FocusNode get passFocus => _passFocus;
  FocusNode get confirmPassFocus => _confirmPassFocus;
}
