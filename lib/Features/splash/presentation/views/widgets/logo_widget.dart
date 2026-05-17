import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:posty/core/utils/app_assets.dart';
import 'package:posty/core/utils/app_colors.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(36),
        border: Border.all(
          color: AppColors.appPrimaryColor.withValues(alpha: 0.15), width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.appPrimaryColor.withValues(alpha: 0.22),
            blurRadius: 48,
            spreadRadius: 0,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset(AppAssets.splashLogo, width: 60),
    );
  }
}