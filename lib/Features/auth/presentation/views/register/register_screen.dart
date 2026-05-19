import 'package:flutter/material.dart';
import 'package:posty/Features/auth/presentation/views/register/register_screen_body.dart';
import 'package:posty/core/shared/shared_components.dart';
import 'package:posty/core/utils/app_colors.dart';

class RegisterScreen extends StatelessWidget
{
  const RegisterScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: customAppBar(context, 'Register',false,true),
      body: const RegisterScreenBody(),
    );
  }

}
