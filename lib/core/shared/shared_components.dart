import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_routes.dart';
import 'package:posty/core/utils/app_styles.dart';
PreferredSizeWidget customAppBar(BuildContext context, String title, bool isHomePosts,bool isOnline)

{
  return AppBar(
    backgroundColor: AppColors.backgroundColor,
    centerTitle: true,
    leading: !isHomePosts? GestureDetector(
      onTap: ()
      {
        GoRouter.of(context).pop();
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.borderColor),
        ),
        child:const Icon(Icons.arrow_forward_ios_rounded, color: AppColors.textPrimaryColor, size: 16),
      ),
    ):null,
    actions: isHomePosts ? [
    GestureDetector(
      onTap: ()
      {
        if(isHomePosts)
        {
          if(isOnline)
          {
            GoRouter.of(context).push(AppRoutes.createPost);

          }
        }
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isOnline?AppColors.appPrimaryColor:AppColors.appPrimaryColor.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.add_rounded, color: Colors.white, size: 20),
      ),
    ),
    ]:null,
    title: Text(title, style:AppStyles.textStyle17),
  );
}
