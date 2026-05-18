import 'package:flutter/material.dart';
import 'package:posty/Features/auth/presentation/manager/login_cubit/cubit.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';


class LoginOptionsRowWidget extends StatelessWidget {
  final LoginCubit cubit;

  const LoginOptionsRowWidget({super.key,required this.cubit,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {},
          child:  Text(
            'Forget ur password?',
            style: AppStyles.textStyle13.copyWith(color: AppColors.appPrimaryColor),
          ),
        ),
        Row(
          children: [
            Text('Remember me', style: AppStyles.textStyle13.copyWith(color: AppColors.textSecondaryColor)),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: ()
              {
                cubit.changeRememberMe();

              },
              child: Container(
                width: 22, height: 22,
                decoration: BoxDecoration(
                  color: cubit.rememberMe ? AppColors.appPrimaryColor : Colors.transparent,
                  border: Border.all(color: AppColors.appPrimaryColor, width: 1.5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: cubit.rememberMe ? const Icon(Icons.check, color: Colors.white, size: 14) : null,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
