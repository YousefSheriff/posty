import 'package:flutter/material.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';


class LoginHeaderWidget extends StatelessWidget {
  final String emoji, title, subtitle;
  const LoginHeaderWidget({super.key, required this.emoji, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(emoji, style:AppStyles.textStyle38),
        const SizedBox(height: 10),
        Text(title, style: AppStyles.textStyle22),
        const SizedBox(height: 4),
        Text(subtitle, style:AppStyles.textStyle13.copyWith(color: AppColors.textSecondaryColor)),
        SizedBox(height: 32),
      ],
    );
  }
}