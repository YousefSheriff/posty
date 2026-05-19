import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posty/Features/auth/presentation/views/login/login_screen_body.dart';
import 'package:posty/core/shared/shared_components.dart';
import 'package:posty/core/theme/theme_cubit.dart';
import 'package:posty/core/theme/theme_states.dart';
import 'package:posty/core/utils/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeStates>(
      builder: (context, themeState) {
        final isDark = ThemeCubit.get(context).isDark;
        return Scaffold(
          backgroundColor: AppColors.backGround(isDark),
          appBar: customAppBar(context, 'Login', false, true, isDark),
          body: const LoginScreenBody(),
        );
      },
    );
  }
}
