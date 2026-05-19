import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posty/Features/posts/presentation/manager/app_cubit/cubit.dart';
import 'package:posty/Features/posts/presentation/manager/app_cubit/states.dart';
import 'package:posty/Features/posts/presentation/views/home_posts/widgets/error_state_widget.dart';
import 'package:posty/Features/posts/presentation/views/post_details/post_details_body.dart';
import 'package:posty/core/shared/shared_components.dart';
import 'package:posty/core/utils/app_colors.dart';

class PostDetailsScreen extends StatelessWidget {
  final String postId;
  const PostDetailsScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsCubit, PostsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = PostsCubit.get(context);

        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: customAppBar(context, 'Post Details', false, true),
          body: ConditionalBuilder(
            condition: state is! GetPostDetailsLoadingState,
            builder: (context)
            {
              if (state is GetPostDetailsErrorState)
              {
                return ErrorStateWidget(onRetry: () {cubit.getPostDetails(postId);},);
              }
              else
              {
                return PostDetailsBody(post: cubit.postDetails!,);
              }
            },
            fallback: (context)
            {
              return const Center(child: CircularProgressIndicator(color: AppColors.appPrimaryColor,),
            );
            },
          ),
        );
      },
    );
  }
}