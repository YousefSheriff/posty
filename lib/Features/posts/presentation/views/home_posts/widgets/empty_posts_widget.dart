import 'package:flutter/material.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';

class EmptyPostsWidget extends StatelessWidget {
  const EmptyPostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(color: AppColors.appPrimaryLightColor, shape: BoxShape.circle),
            child: const Icon(Icons.article_outlined, size: 48, color: AppColors.appPrimaryColor),
          ),
          const SizedBox(height: 20),
          Text('No posts found', style: AppStyles.textStyle17),
        ],
      ),
    );
  }
}
