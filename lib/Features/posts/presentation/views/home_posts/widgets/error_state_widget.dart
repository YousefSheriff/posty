import 'package:flutter/material.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';

class ErrorStateWidget extends StatelessWidget {
  final VoidCallback onRetry;
  const ErrorStateWidget({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration:  BoxDecoration(color: AppColors.errorFieldColor.withValues(alpha: 0.05), shape: BoxShape.circle),

              child: Icon(Icons.face, size: 48, color: AppColors.errorFieldColor.withValues(alpha: 0.7)),
            ),
            const SizedBox(height: 20),
            Text('Something went wrong', style: AppStyles.textStyle17),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: onRetry,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                decoration: BoxDecoration(color: AppColors.appPrimaryColor, borderRadius: BorderRadius.circular(14)),
                child: Text('Try Again', style: AppStyles.textStyle13.copyWith(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
