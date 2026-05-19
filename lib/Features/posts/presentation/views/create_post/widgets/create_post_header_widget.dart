import 'package:flutter/material.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';

class CreatePostHeaderWidget extends StatelessWidget {
  const CreatePostHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: AppColors.appPrimaryLightColor, borderRadius: BorderRadius.circular(14)),
          child: Text('✍️', style:AppStyles.textStyle28),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Share ur thoughts', style: AppStyles.textStyle22),
            const SizedBox(height: 4),
            Text('Write something interesting!', style: AppStyles.textStyle12),
          ],
        ),
      ],
    );
  }
}
