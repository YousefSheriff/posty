import 'package:flutter/material.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';

class FooterWidget extends StatelessWidget {
  final String firstText ;
  final String secondText ;
  final VoidCallback onPressed;
  const FooterWidget({super.key, required this.firstText, required this.secondText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: GestureDetector(
        onTap:onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(firstText,style: AppStyles.textStyle14.copyWith(color: AppColors.textSecondaryColor),),
            Text(secondText,style: AppStyles.textStyle14.copyWith(color: AppColors.appPrimaryColor, fontWeight: FontWeight.bold, decoration: TextDecoration.underline, decorationColor: AppColors.appPrimaryColor,),),
          ],
        ),
      ),
    );
  }
}
