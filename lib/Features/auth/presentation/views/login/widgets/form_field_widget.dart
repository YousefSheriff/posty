import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posty/core/app_cubit/cubit.dart';
import 'package:posty/core/app_cubit/states.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';

class Field extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData? icon;
  final bool obscure, readOnly, isTextArea;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;

  const Field({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.icon,
    this.obscure = false,
    this.readOnly = false,
    this.isTextArea = false,
    this.suffix,
    this.keyboardType,
    this.validator,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostyCubit, PostyStates>(
      listener: (BuildContext context, PostyStates state) {},
      builder: (BuildContext context, PostyStates state) {
        final cubit = PostyCubit.get(context);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppStyles.textStyle13.copyWith(
                color: isTextArea ? null : AppColors.textPrimaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Focus(
              onFocusChange: (value) {
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
                  obscureText: isTextArea ? false : obscure,
                  keyboardType: keyboardType,
                  readOnly: readOnly,
                  onTap: onTap,
                  maxLines: isTextArea ? 6 : 1,
                  style: isTextArea
                      ? AppStyles.textStyle14.copyWith(color: AppColors.textPrimaryColor)
                      : AppStyles.textStyle15.copyWith(fontWeight: FontWeight.normal, color: AppColors.textPrimaryColor),
                  validator: validator ??
                      (isTextArea
                          ? (value) {
                        if (value == null || value.isEmpty) {
                          return 'enter post content';
                        }
                        return null;
                      }
                          : null),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: AppStyles.textStyle14.copyWith(color: AppColors.textSecondaryColor),
                    prefixIcon: isTextArea
                        ? null
                        : Icon(
                      icon,
                      color: cubit.isFocused ? AppColors.appPrimaryColor : AppColors.textSecondaryColor,
                      size: 20,
                    ),
                    suffixIcon: (!isTextArea && suffix != null)
                        ? Padding(padding: const EdgeInsets.only(left: 10), child: suffix)
                        : null,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16),
                    errorStyle: AppStyles.textStyle11.copyWith(color: AppColors.errorFieldColor),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}