import 'package:flutter/material.dart';
import 'package:posty/Features/posts/presentation/views/home_posts/widgets/custom_app_bar_widget.dart';
import 'package:posty/core/utils/app_colors.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBarWidget(),
    );
  }
}
