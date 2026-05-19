import 'package:flutter/material.dart';
import 'package:posty/Features/posts/data/models/post_model.dart';
import 'package:posty/Features/posts/presentation/views/post_details/post_details_screen.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';

class PostCardWidget extends StatelessWidget {
  final PostModel post;
  const PostCardWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (_) => PostDetailsScreen(post: post)));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderColor),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8, offset: const Offset(0, 2))],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42, height: 42,
              decoration: BoxDecoration(color: AppColors.appPrimaryLightColor, borderRadius: BorderRadius.circular(12)),
              alignment: Alignment.center,
              child: Text('#${post.id}', style: AppStyles.textStyle12.copyWith(color: AppColors.appPrimaryColor, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.title.toString(), style: AppStyles.textStyle13, maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 6),
                  Text(post.body.toString(), style: AppStyles.textStyle12, maxLines: 2, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: AppColors.textSecondaryColor),
          ],
        ),
      ),
    );
  }
}
