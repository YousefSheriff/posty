import 'package:flutter/material.dart';
import 'package:posty/Features/posts/data/models/post_model.dart';
import 'package:posty/Features/posts/presentation/views/home_posts/widgets/post_card_widget.dart' show PostCardWidget;
import 'package:posty/Features/posts/presentation/views/home_posts/widgets/search_field_widget.dart';

class PostsListBody extends StatelessWidget {
  const PostsListBody({super.key});

  @override
  Widget build(BuildContext context) {
    PostModel model = PostModel(title: 'go to gym',body: 'text body text body text body text body text body text body text body',id: 1,userId: 25);

    return Column(
      children: [
        SearchFieldWidget(onChanged: (value){}),
        PostCardWidget(post:model)
      ],
    );
  }
}
