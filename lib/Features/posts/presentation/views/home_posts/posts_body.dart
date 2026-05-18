import 'package:flutter/material.dart';
import 'package:posty/Features/posts/presentation/views/home_posts/widgets/search_field_widget.dart';



class PostsListBody extends StatelessWidget {
  const PostsListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchFieldWidget(onChanged: (value){}),
      ],
    );
  }
}
