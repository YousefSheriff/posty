import 'package:flutter/material.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';

class PostInfoWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  const PostInfoWidget({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(color: AppColors.appPrimaryLightColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.appPrimaryColor),
          const SizedBox(width: 6),
          Text(label, style: AppStyles.textStyle12.copyWith(color: AppColors.appPrimaryColor, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
