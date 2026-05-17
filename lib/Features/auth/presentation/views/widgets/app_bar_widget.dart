import 'package:flutter/material.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';
PreferredSizeWidget customAppBar(BuildContext context, String title)

{
  return AppBar(
    backgroundColor: AppColors.backgroundColor,
    centerTitle: true,
    leading: GestureDetector(
      onTap: ()
      {
        Navigator.pop(context);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: const Icon(Icons.arrow_forward_ios_rounded, color: AppColors.textPrimaryColor, size: 16),
      ),
    ),
    title: Text(title, style:AppStyles.textStyle17),
  );
}
