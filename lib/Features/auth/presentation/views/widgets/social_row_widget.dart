import 'package:flutter/material.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        socialButton('Google', Icons.g_mobiledata_rounded, AppColors.googleLogoColor),
        const SizedBox(width: 12),
        socialButton('Apple', Icons.apple_rounded, AppColors.textPrimaryColor),
        const SizedBox(width: 12),
        socialButton('Facebook', Icons.facebook_rounded, AppColors.facebookLogoColor),
      ],
    );
  }

  Widget socialButton(String label, IconData icon, Color color) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.borderColor),
          boxShadow:  [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 6)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(width: 6),
            Text(label, style: AppStyles.textStyle12.copyWith(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
