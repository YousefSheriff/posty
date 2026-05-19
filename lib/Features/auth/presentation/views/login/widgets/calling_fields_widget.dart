import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posty/Features/auth/presentation/manager/login_cubit/cubit.dart';
import 'package:posty/Features/auth/presentation/views/login/widgets/form_field_widget.dart';
import 'package:posty/core/theme/theme_cubit.dart';
import 'package:posty/core/theme/theme_states.dart';
import 'package:posty/core/utils/app_colors.dart';

class LoginFieldsWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final LoginCubit cubit;

  const LoginFieldsWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeStates>(
      builder: (context, themeState) {
        final isDark = ThemeCubit.get(context).isDark;

        return Column(
          children: [
            Field(
              isDark: isDark,
              controller: emailController,
              label: 'Email',
              hint: 'example@email.com',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'enter right email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Field(
              isDark: isDark,
              controller: passwordController,
              label: 'Password',
              hint: '••••••••',
              icon: Icons.lock_outline_rounded,
              obscure: cubit.isPassword,
              suffix: GestureDetector(
                onTap: () { cubit.changeEyeIcon(); },
                child: Icon(cubit.suffix, color: AppColors.textSecondary(isDark), size: 20),
              ),
              validator: (value)
              {
                if (value == null || value.isEmpty)
                {
                  return 'enter ur password';
                }
                return null;
              },
            ),
          ],
        );
      },
    );
  }
}