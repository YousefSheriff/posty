import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posty/core/theme/theme_cubit.dart';
import 'package:posty/core/theme/theme_states.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';

class SearchFieldWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const SearchFieldWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeStates>(
      builder: (context, themeState) {
        final isDark = ThemeCubit.get(context).isDark;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.card(isDark),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border(isDark)),
            ),
            child: TextField(
              onChanged: onChanged,
              style: AppStyles.textStyle14.copyWith(
                color: AppColors.textPrimary(isDark),
              ),
              decoration: InputDecoration(
                hintText: 'Search posts...',
                hintStyle: AppStyles.textStyle14.copyWith(
                  color: AppColors.textSecondary(isDark),
                ),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: AppColors.textSecondary(isDark),
                  size: 20,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
          ),
        );
      },
    );
  }
}