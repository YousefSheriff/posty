import 'package:flutter/material.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';

class Field extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData? icon;
  final bool obscure, readOnly, isTextArea;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;

  const Field({super.key, required this.controller, required this.label, required this.hint, this.icon, this.obscure = false, this.readOnly = false, this.isTextArea = false, this.suffix, this.keyboardType, this.validator, this.onTap,});

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppStyles.textStyle13.copyWith(
            color: widget.isTextArea ? null : AppColors.textPrimaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Focus(
          onFocusChange: (value) {
            setState(() {
              _isFocused = value;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: _isFocused ? AppColors.appPrimaryColor : AppColors.borderColor,
                width: _isFocused ? 1.5 : 1,
              ),
              boxShadow: _isFocused
                  ? [BoxShadow(color: AppColors.appPrimaryColor.withValues(alpha: 0.12), blurRadius: 10)]
                  : null,
            ),
            child: TextFormField(
              controller: widget.controller,
              obscureText: widget.isTextArea ? false : widget.obscure,
              keyboardType: widget.keyboardType,
              readOnly: widget.readOnly,
              onTap: widget.onTap,
              maxLines: widget.isTextArea ? 6 : 1,
              style: widget.isTextArea
                  ? AppStyles.textStyle14.copyWith(color: AppColors.textPrimaryColor)
                  : AppStyles.textStyle15.copyWith(fontWeight: FontWeight.normal, color: AppColors.textPrimaryColor),
              validator: widget.validator ?? (widget.isTextArea ? (value)
              {
                    if (value == null || value.isEmpty) {
                      return 'enter post content';
                    }
                    return null;
              } : null),
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: AppStyles.textStyle14.copyWith(color: AppColors.textSecondaryColor),
                prefixIcon: widget.isTextArea
                    ? null
                    : Icon(
                  widget.icon,
                  color: _isFocused ? AppColors.appPrimaryColor : AppColors.textSecondaryColor,
                  size: 20,
                ),
                suffixIcon: (!widget.isTextArea && widget.suffix != null)
                    ? Padding(padding: const EdgeInsets.only(left: 10), child: widget.suffix)
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
  }
}