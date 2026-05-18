import 'package:flutter/material.dart';
import 'package:posty/Features/auth/presentation/views/main_auth/auth_screen_body.dart';
import 'package:posty/core/utils/app_colors.dart';


class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: MainAuthScreenBody(),
    );
  }
}









