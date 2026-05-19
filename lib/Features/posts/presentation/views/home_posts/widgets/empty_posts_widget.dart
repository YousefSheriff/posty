import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posty/core/theme/theme_cubit.dart';
import 'package:posty/core/theme/theme_states.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';

class EmptyPostsWidget extends StatelessWidget {
  const EmptyPostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeStates>(
      builder: (context, themeState) {
        final isDark = ThemeCubit.get(context).isDark;

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.appPrimaryColor.withValues(alpha: 0.15)
                      : AppColors.appPrimaryLightColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.article_outlined,
                  size: 48,
                  color: AppColors.appPrimaryColor,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'No posts found',
                style: AppStyles.textStyle17.copyWith(
                  color: AppColors.textPrimary(isDark),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}