import 'package:flutter/material.dart';
import 'package:posty/Features/posts/data/models/post_model.dart';
import 'package:posty/Features/posts/data/models/posts_fake_data.dart';
import 'package:posty/Features/posts/presentation/views/home_posts/widgets/empty_posts_widget.dart';
import 'package:posty/Features/posts/presentation/views/home_posts/widgets/post_card_widget.dart' show PostCardWidget;
import 'package:posty/Features/posts/presentation/views/home_posts/widgets/search_field_widget.dart';

class PostsListBody extends StatelessWidget {
  const PostsListBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<PostModel> posts = PostsFakeData.posts;

    return Column(
      children: [
        SearchFieldWidget(onChanged: (value){}),
        Expanded(child: posts.isEmpty ? const EmptyPostsWidget() : postsList(posts),),
      ],
    );
  }

  Widget postsList(List<PostModel> posts)
  {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      itemCount: posts.length,
      separatorBuilder: (context, index)
      {
        return const SizedBox(height: 12);
      },
      itemBuilder: (context, index) {
        return PostCardWidget(post: posts[index]);
      },
    );
  }
}
