import 'package:flutter/material.dart';
import 'package:skill_bridge/core/utils/app_scale.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? labelText;
  final IconData? suffixIcon;
  final String? errorText;
  final void Function()? onObsecureTap;

  const AppTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.onChanged,
    this.onSaved,
    this.labelText,
    this.suffixIcon,
    this.errorText,
    this.onObsecureTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      onChanged: onChanged,
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      onSaved: onSaved,
      style: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: AppScale.sp(16),
        height: AppScale.dp(1.2),
        color: const Color(0xDD000000),
      ),
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
        labelStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: AppScale.sp(16),
          color: const Color(0xFFB5B4B6),
          fontWeight: FontWeight.w500,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppScale.dp(10),
          vertical: AppScale.dp(18),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: const Color(0xDD000000),
            width: AppScale.dp(1.5),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: const Color(0xFFC7C6C6)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: const Color(0xFFEB4646)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: const Color(0xFFEB4646)),
        ),
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        floatingLabelStyle: const TextStyle(
          fontFamily: 'Inter',
          color: Color(0xDD000000),
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(icon: Icon(suffixIcon), onPressed: onObsecureTap)
            : null,
      ),
    );
  }
}
