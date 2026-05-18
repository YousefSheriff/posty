import 'package:flutter/material.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: GestureDetector(
        onTap: () {},
        child: RichText(
          text:  TextSpan(
            text: 'Do not have an account?   ',
            style: AppStyles.textStyle14.copyWith(color: AppColors.textSecondaryColor),
            children: [
              TextSpan(
                text: 'Register now',
                style: AppStyles.textStyle14.copyWith(color: AppColors.appPrimaryColor, fontWeight: FontWeight.bold, decoration: TextDecoration.underline, decorationColor: AppColors.appPrimaryColor,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
