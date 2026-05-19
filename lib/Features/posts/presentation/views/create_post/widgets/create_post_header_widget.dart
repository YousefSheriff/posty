import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posty/core/theme/theme_cubit.dart';
import 'package:posty/core/theme/theme_states.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';

class CreatePostHeaderWidget extends StatelessWidget {
  const CreatePostHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeStates>(
      builder: (context, themeState) {
        final isDark = ThemeCubit.get(context).isDark;

        return Row(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.appPrimaryColor.withValues(alpha: 0.15)
                    : AppColors.appPrimaryLightColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text('✍️', style: AppStyles.textStyle28),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Share ur thoughts',
                  style: AppStyles.textStyle22.copyWith(
                    color: AppColors.textPrimary(isDark),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Write something interesting!',
                  style: AppStyles.textStyle12.copyWith(
                    color: AppColors.textSecondary(isDark),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}