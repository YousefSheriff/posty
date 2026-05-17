import 'package:flutter/material.dart';
import 'package:posty/Features/auth/presentation/views/widgets/form_field_widget.dart';
import 'package:posty/core/utils/app_colors.dart';

class LoginFieldsWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginFieldsWidget({super.key, required this.emailController, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
      [
        Field(
          controller: emailController,
          label: 'Email ',
          hint: 'example@email.com',
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
          validator: (value)
          {
            if (value == null || value.isEmpty)
            {
              return 'enter right email';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        Field(
          controller: passwordController,
          label: 'Password',
          hint: '••••••••',
          icon: Icons.lock_outline_rounded,
          obscure: true ,
          suffix: GestureDetector(
            onTap: ()
            {
            },
            child: Icon(Icons.remove_red_eye, color: AppColors.textSecondaryColor, size: 20,),
          ),
          validator: (value) {
            if (value == null || value.isEmpty)
            {
              return 'enter ur password';
            }
            return null;
          },
        ),
      ],
    );
  }
}
