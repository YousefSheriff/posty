import 'package:flutter/material.dart';
import 'package:posty/Features/posts/presentation/views/create_post/create_post_body.dart';
import 'package:posty/core/shared/shared_components.dart';
import 'package:posty/core/utils/app_colors.dart';

class CreatePostScreen extends StatelessWidget
{
  const CreatePostScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: customAppBar(context, 'New Post',false,true),
      body: CreatePostBody(),
    );
  }
}
