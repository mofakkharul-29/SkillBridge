import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_bridge/core/theme/app_colors.dart';
import 'package:skill_bridge/core/utils/app_scale.dart';
import 'package:skill_bridge/core/utils/app_text_form_field.dart';
import 'package:skill_bridge/core/utils/custom_devider.dart';
import 'package:skill_bridge/core/utils/global_text.dart';
import 'package:skill_bridge/core/utils/primary_button.dart';
import 'package:skill_bridge/core/utils/primary_text_button.dart';
import 'package:skill_bridge/feature/auth/provider/form_notifier_provider.dart';
import 'package:skill_bridge/feature/auth/widget/footer.dart';
import 'package:skill_bridge/feature/splash/widgets/header_section.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(formNotifierProvider);
    final form = ref.read(formNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppScale.dp(15)),
          child: Column(
            children: [
              HeaderSection(fontSize: 28, iconSize: 30, height: 45, width: 45),

              SizedBox(height: AppScale.dp(30)),

              GlobalText(
                text: formState.isLogin ? 'Welcome Back!' : 'Create Account',
                fontFamily: 'Poppins',
                fontSize: AppScale.sp(30),
                fontWeight: FontWeight.w800,
                height: AppScale.dp(1.5),
              ),

              SizedBox(height: AppScale.dp(30)),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (!formState.isLogin) ...[
                      AppTextFormField(
                        labelText: 'Full name',
                        controller: form.nameController,
                        focusNode: form.nameFocus,
                        errorText: formState.nameError,
                        onChanged: form.validateName,
                      ),
                      SizedBox(height: AppScale.dp(16)),
                    ],

                    AppTextFormField(
                      labelText: 'Email',
                      controller: form.emailController,
                      focusNode: form.emailFocus,
                      errorText: formState.emailError,
                      onChanged: form.validateEmail,
                    ),

                    SizedBox(height: AppScale.dp(16)),

                    AppTextFormField(
                      labelText: 'Password',
                      controller: form.passController,
                      focusNode: form.passFocus,
                      obscureText: !formState.isPasswordVisible,
                      suffixIcon: formState.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      errorText: formState.passwordError,
                      onChanged: form.validatePassword,
                      onObsecureTap: form.togglePasswordVisibility,
                    ),

                    if (!formState.isLogin) ...[
                      SizedBox(height: AppScale.dp(16)),
                      AppTextFormField(
                        labelText: 'Confirm password',
                        controller: form.confirmPassController,
                        focusNode: form.confirmPassFocus,
                        obscureText: !formState.isConfirmPasswordVisible,
                        suffixIcon: formState.isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        errorText: formState.confirmPasswordError,
                        onChanged: form.validateConfirmPassword,
                        onObsecureTap: form.toggleConfirmPasswordVisibility,
                      ),
                      SizedBox(height: AppScale.dp(4)),
                    ],

                    if (formState.isLogin) ...[
                      PrimaryTextButton(
                        text: 'Forgot password?',
                        onPressed: () => debugPrint('tapped'),
                      ),
                    ],

                    SizedBox(height: AppScale.dp(!formState.isLogin ? 20 : 4)),

                    PrimaryButton(
                      text: formState.isLogin ? 'LogIn' : 'Sign Up',
                      icon: formState.isLogin
                          ? Icons.login
                          : Icons.person_add_alt,
                      iconSize: 25,
                      vtPadding: 16,
                      textFont: 17,
                      onPressed: form.validateForm,
                    ),

                    SizedBox(height: AppScale.dp(35)),

                    const CustomDevider(),

                    SizedBox(height: AppScale.dp(25)),

                    PrimaryButton(
                      text: 'Sign in with Google',
                      isNeed: false,
                      isPrefixNeed: true,
                      vtPadding: 16,
                      textFont: 17,
                      backgroundColor: const Color(0xFFEEEEEE),
                      foregroundColor: const Color(0xDD000000),
                      onPressed: () {},
                    ),

                    SizedBox(height: AppScale.dp(20)),

                    Footer(
                      isLogin: formState.isLogin,
                      onPressed: form.onLoginToggle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
