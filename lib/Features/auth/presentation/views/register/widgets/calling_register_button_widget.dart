import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:posty/Features/auth/presentation/manager/register_cubit/states.dart';
import 'package:posty/Features/auth/presentation/views/widgets/primary_button_widget.dart';

class RegisterButtonWidget extends StatelessWidget {
  final RegisterStates state;
  final VoidCallback onRegisterPressed;

  const RegisterButtonWidget({super.key, required this.state, required this.onRegisterPressed});

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: state is! RegisterLoadingState,
      builder: (BuildContext context) {
        return  PrimaryButton(
          label: 'Register',
          onTap: onRegisterPressed,
        );
      },
      fallback: (BuildContext context) {return const Center(child: CircularProgressIndicator());},
    );
  }
}
