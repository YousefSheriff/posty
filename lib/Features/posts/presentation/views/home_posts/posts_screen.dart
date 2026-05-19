import 'package:flutter/material.dart';
import 'package:posty/Features/posts/presentation/views/home_posts/posts_body.dart';
import 'package:posty/core/shared/shared_components.dart';
import 'package:posty/core/utils/app_colors.dart';

class PostyScreen extends StatelessWidget {
  const PostyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: customAppBar(context, 'Posts',true),
      body: PostsListBody(),
    );
  }
}
