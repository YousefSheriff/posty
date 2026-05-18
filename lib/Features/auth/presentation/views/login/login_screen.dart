import 'package:flutter/material.dart';
import 'package:posty/Features/auth/presentation/views/login/login_screen_body.dart';
import 'package:posty/Features/auth/presentation/views/login/widgets/app_bar_widget.dart';
import 'package:posty/core/utils/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: customAppBar(context, 'Login'),
      body: const LoginScreenBody(),
    );
  }


}













