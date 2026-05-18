import 'package:flutter/material.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';

class PrimaryButton extends StatelessWidget
{
  final String label;
  final VoidCallback onTap;
  const PrimaryButton({super.key, required this.label, required this.onTap,});

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity, height: 54,
        decoration: BoxDecoration(
          color: AppColors.appPrimaryColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: AppColors.appPrimaryColor.withValues(alpha: 0.35), blurRadius: 14, offset: const Offset(0, 5))],
        ),
        alignment: Alignment.center,
        child:Text(label, style: AppStyles.textStyle16.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }
}