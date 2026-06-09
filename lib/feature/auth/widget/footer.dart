import 'package:flutter/widgets.dart';
import 'package:skill_bridge/core/utils/app_scale.dart';
import 'package:skill_bridge/core/utils/global_text.dart';
import 'package:skill_bridge/core/utils/primary_text_button.dart';

class Footer extends StatelessWidget {
  final bool isLogin;
  final void Function()? onPressed;

  const Footer({super.key, required this.isLogin, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GlobalText(
          text: isLogin
              ? 'Don\'t have an account? '
              : 'Already have an account?',
          textAlign: TextAlign.center,
          fontFamily: 'Inter',
          fontSize: AppScale.sp(16),
          height: AppScale.dp(1.2),
          color: const Color(0xFF616161),
        ),
        SizedBox(width: AppScale.dp(6)),
        PrimaryTextButton(
          text: isLogin ? 'Sign up' : 'Log In',
          onPressed: onPressed,
        ),
      ],
    );
  }
}
