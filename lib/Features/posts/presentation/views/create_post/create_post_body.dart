import 'package:flutter/material.dart';
import 'package:posty/Features/posts/presentation/views/create_post/widgets/create_post_header_widget.dart';

class CreatePostBody extends StatelessWidget
{
  const CreatePostBody({super.key});

  @override
  Widget build(BuildContext context)
  {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CreatePostHeaderWidget(),
        ],
      ),
    );
  }
}
