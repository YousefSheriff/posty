import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posty/Features/auth/presentation/views/register/register_screen_body.dart';
import 'package:posty/core/shared/shared_components.dart';
import 'package:posty/core/theme/theme_cubit.dart';
import 'package:posty/core/theme/theme_states.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeStates>(
      builder: (context, themeState) {
        final isDark = ThemeCubit.get(context).isDark;
        return Scaffold(
          appBar: customAppBar(context, 'Register', false, true, isDark),
          body: const RegisterScreenBody(),
        );
      },
    );
  }
}
