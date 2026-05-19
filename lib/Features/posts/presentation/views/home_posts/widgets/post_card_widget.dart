import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posty/Features/posts/data/models/post_model.dart';
import 'package:posty/Features/posts/presentation/manager/app_cubit/cubit.dart';
import 'package:posty/Features/posts/presentation/manager/app_cubit/states.dart';
import 'package:posty/Features/posts/presentation/views/post_details/post_details_screen.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';

class PostCardWidget extends StatelessWidget {
  final PostModel post;
  const PostCardWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<PostsCubit,PostsStates>(
      listener: (BuildContext context, PostsStates state) {  },
      builder: (BuildContext context, PostsStates state)
      {
        return GestureDetector(
          onTap: ()
          {
            PostsCubit.get(context).getPostDetails(post.id!);

            Navigator.push(context, MaterialPageRoute(builder: (context)
            {
              return PostDetailsScreen(postId:post.id.toString());
            },),);
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderColor),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                      Row(
                        children: [
                          Expanded(child: Text(post.title.toString(), style: AppStyles.textStyle13, maxLines: 2, overflow: TextOverflow.ellipsis)),
                          SizedBox(width: 10,),
                          Text(post.dateTime.toString(), style: AppStyles.textStyle10,),
                        ],
                      ),
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
      },
    );
  }
}
