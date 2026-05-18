import 'package:flutter/material.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';

class SearchFieldWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const SearchFieldWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: TextField(
          onChanged: onChanged,
          style: AppStyles.textStyle14.copyWith(color: AppColors.textPrimaryColor),
          decoration: InputDecoration(
            hintText: 'Search posts...',
            hintStyle: AppStyles.textStyle14.copyWith(color: AppColors.textSecondaryColor),
            prefixIcon: const Icon(Icons.search_rounded, color: AppColors.textSecondaryColor, size: 20),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      ),
    );
  }
}
