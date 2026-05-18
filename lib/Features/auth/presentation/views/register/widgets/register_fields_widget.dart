import 'package:flutter/material.dart';
import 'package:posty/Features/auth/presentation/manager/register_cubit/cubit.dart';
import 'package:posty/Features/auth/presentation/views/login/widgets/form_field_widget.dart';
import 'package:posty/core/utils/app_colors.dart';

class RegisterFieldsWidget extends StatelessWidget
{
  final TextEditingController  nameController ;
  final TextEditingController  emailController;
  final TextEditingController  phoneController;
  final TextEditingController  passwordController;
  final RegisterCubit cubit;



  const RegisterFieldsWidget({super.key, required this.nameController, required this.emailController, required this.phoneController, required this.passwordController, required this.cubit,});

  @override
  Widget build(BuildContext context)
  {
    return  Column(
      children: [
        Field(
            controller: nameController,
            label: 'Full Name',
            hint: 'Ur name',
            icon: Icons.person_outline_rounded,
            validator: (value)
            {
              return (value == null || value.isEmpty) ? 'enter ur name ' : null;
            }),

        const SizedBox(height: 16),
        Field(
            controller: emailController,
            label: 'Email',
            hint: 'example@email.com',
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            validator: (value)
            {
              if (value == null || value.isEmpty) return 'enter ur email';
              return null;
            }),
        const SizedBox(height: 16),
        Field(
          controller: phoneController,
          label: 'Phone',
          hint: '+201000000000',
          keyboardType: TextInputType.phone,
          icon: Icons.phone_android,
          validator: (value)
          {
            if (value == null || value.isEmpty) return 'enter ur phone';
            return null;
          },
        ),
        const SizedBox(height: 16),
        Field(
          controller: passwordController,
          label: 'Password',
          hint: '••••••••',
          icon: Icons.lock_outline_rounded,
          obscure: cubit.isPassword,
          suffix: GestureDetector(
            onTap: ()
            {
              cubit.changeEyeIcon();
            },
            child: Icon(cubit.suffix, color: AppColors.textSecondaryColor, size: 20,),
          ),
          validator: (value)
          {
            if (value == null || value.isEmpty) return 'enter password';
            return null;
          },
        ),
      ],
    );
  }
}