import 'package:flutter/material.dart';
import 'package:posty/Features/splash/presentation/views/splash_screen_body.dart';
import 'package:posty/core/theme/theme_cubit.dart';
import 'package:posty/core/theme/theme_states.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocBuilder<ThemeCubit, ThemeStates>(
        builder: (context, themeState)
      {
        final isDark = ThemeCubit.get(context).isDark;
        return Scaffold(
          backgroundColor: AppColors.backGround(isDark),
          body: const SplashScreenBody(),
        );
      }
    );
  }
}



