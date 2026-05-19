import 'package:flutter/material.dart';
import 'package:posty/Features/posts/data/models/post_model.dart';
import 'package:posty/Features/posts/presentation/views/post_details/post_details_body.dart';
import 'package:posty/core/shared/shared_components.dart';
import 'package:posty/core/utils/app_colors.dart';

class PostDetailsScreen extends StatelessWidget {
  final PostModel post;
  const PostDetailsScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: customAppBar(context, 'Post Details',false),
      body: PostDetailsBody(post: post),
    );
  }
}
