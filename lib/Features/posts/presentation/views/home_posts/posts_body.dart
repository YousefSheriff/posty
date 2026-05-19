import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posty/Features/posts/presentation/manager/app_cubit/cubit.dart';
import 'package:posty/Features/posts/presentation/manager/app_cubit/states.dart';
import 'package:posty/Features/posts/presentation/views/home_posts/widgets/empty_posts_widget.dart';
import 'package:posty/Features/posts/presentation/views/home_posts/widgets/error_state_widget.dart';
import 'package:posty/Features/posts/presentation/views/home_posts/widgets/post_card_widget.dart';
import 'package:posty/Features/posts/presentation/views/home_posts/widgets/search_field_widget.dart';
import 'package:posty/core/utils/app_colors.dart';

class PostsListBody extends StatelessWidget {
  final bool isOnline;
  const PostsListBody({super.key, required this.isOnline});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsCubit, PostsStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        final cubit = PostsCubit.get(context);


        if (state is GetPostsLoadingState)
        {
          return const Center(child: CircularProgressIndicator(color: AppColors.appPrimaryColor),);
        }

        if (state is GetPostsErrorState)
        {
          return ErrorStateWidget(onRetry: () {cubit.getPosts();},);
        }
        return Column(
          children:
          [
            SearchFieldWidget(
              onChanged: (value)
              {
                if(isOnline)
                {
                  cubit.searchPosts(value);
                }
              },
            ),
            Expanded(child: cubit.searchPostsResult.isEmpty ? const EmptyPostsWidget() : postsList(cubit),),
          ],
        );
      },
    );
  }

  Widget postsList(PostsCubit cubit)
  {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      itemCount: cubit.searchPostsResult.length,
      separatorBuilder: (context, index)
      {
        return const SizedBox(height: 12);
      },
      itemBuilder: (context, index)
      {
        return PostCardWidget(post: cubit.searchPostsResult[index]);
      },
    );
  }
}
