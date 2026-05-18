import 'package:flutter/material.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';

class LoginOrDividerWidget extends StatelessWidget {
  const LoginOrDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(height: 1, color: AppColors.borderColor)),
         Padding(padding: const EdgeInsets.symmetric(horizontal: 14), child: Text('Or', style:AppStyles.textStyle13.copyWith(color: AppColors.textSecondaryColor)),),
        Expanded(child: Container(height: 1, color: AppColors.borderColor)),
      ],
    );
  }
}