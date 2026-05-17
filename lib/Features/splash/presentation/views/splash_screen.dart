import 'package:flutter/material.dart';
import 'package:posty/Features/splash/presentation/views/splash_screen_body.dart';
import 'package:posty/core/utils/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SplashScreenBody(),
    );
  }
}



