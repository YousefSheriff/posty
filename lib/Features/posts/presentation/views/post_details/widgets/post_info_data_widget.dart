import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posty/core/theme/theme_cubit.dart';
import 'package:posty/core/theme/theme_states.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';

class PostDataWidget extends StatelessWidget {
  final String label;
  final String content;
  final bool isBody;
  const PostDataWidget({super.key, required this.label, required this.content, this.isBody = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeStates>(
      builder: (context, themeState) {
        final isDark = ThemeCubit.get(context).isDark;

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.card(isDark),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border(isDark)),
            boxShadow: [
              BoxShadow(color: Colors.black.withValues(alpha: isDark ? 0.15 : 0.03)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppStyles.textStyle12.copyWith(
                  color: AppColors.appPrimaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                content,
                style: (isBody ? AppStyles.textStyle14 : AppStyles.textStyle17)
                    .copyWith(color: AppColors.textPrimary(isDark)),
              ),
            ],
          ),
        );
      },
    );
  }
}