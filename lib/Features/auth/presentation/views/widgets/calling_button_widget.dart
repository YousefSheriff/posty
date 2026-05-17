import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:posty/Features/auth/presentation/views/widgets/primary_button_widget.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key, required this.onLoginPressed});

  final VoidCallback onLoginPressed;



  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: true,
      builder: (BuildContext context) {
        return PrimaryButton(label: 'Login',
        onTap:onLoginPressed,
        );
      },
      fallback: (BuildContext context) {
        return const Center(
            child: CircularProgressIndicator());
      },
    );
  }
}
