import 'package:flutter/material.dart';
import 'package:skill_bridge/core/theme/app_colors.dart';
import 'package:skill_bridge/core/utils/app_scale.dart';
import 'package:skill_bridge/core/utils/app_text_form_field.dart';
import 'package:skill_bridge/feature/splash/widgets/header_section.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passFocus = FocusNode();
  final FocusNode _confirmPassFocus = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();

    _nameFocus.dispose();
    _emailFocus.dispose();
    _passFocus.dispose();
    _confirmPassFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppScale.dp(15)),
          child: Column(
            children: [
              HeaderSection(fontSize: 28, iconSize: 30, height: 45, width: 45),
              SizedBox(height: AppScale.dp(20)),
              Form(
                child: Column(
                  children: [
                    AppTextFormField(
                      labelText: 'Full name',
                      controller: _nameController,
                      focusNode: _nameFocus,
                    ),

                    SizedBox(height: AppScale.dp(16)),

                    AppTextFormField(
                      labelText: 'Email',
                      controller: _emailController,
                      focusNode: _emailFocus,
                    ),

                    SizedBox(height: AppScale.dp(16)),

                    AppTextFormField(
                      labelText: 'Password',
                      controller: _passController,
                      focusNode: _passFocus,
                    ),

                    SizedBox(height: AppScale.dp(16)),

                    AppTextFormField(
                      labelText: 'Confirm password',
                      controller: _confirmPassController,
                      focusNode: _confirmPassFocus,
                    ),

                    SizedBox(height: AppScale.dp(16)),
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
