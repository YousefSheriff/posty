import 'package:flutter/material.dart';
import 'package:posty/Features/splash/presentation/views/widgets/logo_widget.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';

class LogoAndAppNameWidget extends StatelessWidget {
  const LogoAndAppNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LogoWidget(),
        const SizedBox(height: 20),
         Text(
          'Posty',
          style:AppStyles.textStyle42,
        ),
        const SizedBox(height: 10),
        Text(
          'YOUR SOCIAL SPACE',
          style: AppStyles.textStyle14.copyWith(color: AppColors.textSecondaryColor),
        ),
      ],
    );
  }
}
