import 'package:flutter/material.dart';
import 'package:posty/Features/posts/data/models/post_model.dart';
import 'package:posty/Features/posts/presentation/views/post_details/widgets/post_info_chip_widget.dart';

class PostDetailsBody extends StatelessWidget {
  final PostModel post;
  const PostDetailsBody({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostInfoWidget(icon: Icons.person_outline_rounded, label: 'Post ID: ${post.id}'),
        ],
      ),
    );
  }
}

