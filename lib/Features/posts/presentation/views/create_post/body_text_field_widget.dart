import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posty/core/app_cubit/cubit.dart';
import 'package:posty/core/app_cubit/states.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';


class BodyTextFieldWidget extends StatelessWidget {

final TextEditingController controller;

  const BodyTextFieldWidget({super.key, required this.controller});

@override
  Widget build(BuildContext context) {
    return BlocConsumer<PostyCubit,PostyStates>(
      listener: (BuildContext context, PostyStates state) {  },
      builder: (BuildContext context, PostyStates state) {
        final cubit = PostyCubit.get(context);

        return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Content', style: AppStyles.textStyle13.copyWith(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Focus(
              onFocusChange: (value)
              {
                cubit.changeFocused(value);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: cubit.isFocused ? AppColors.appPrimaryColor : AppColors.borderColor,
                    width: cubit.isFocused ? 1.5 : 1,
                  ),
                  boxShadow: cubit.isFocused
                      ? [BoxShadow(color: AppColors.appPrimaryColor.withValues(alpha: 0.12), blurRadius: 10)]
                      : null,
                ),
                child: TextFormField(
                  controller: controller,
                  maxLines: 6,
                  style: AppStyles.textStyle14.copyWith(color: AppColors.textPrimaryColor),
                  decoration: InputDecoration(
                    hintText: 'Write ur post content here...',
                    hintStyle: AppStyles.textStyle14.copyWith(color: AppColors.textSecondaryColor),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16),
                    errorStyle: AppStyles.textStyle11.copyWith(color: AppColors.errorFieldColor),
                  ),
                  validator: (value)
                  {
                    if (value == null || value.isEmpty)
                    {
                      return 'enter post content';
                    }
                    return null;

                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}