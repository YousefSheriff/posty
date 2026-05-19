import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posty/Features/auth/presentation/views/login/widgets/form_field_widget.dart';
import 'package:posty/Features/auth/presentation/views/widgets/primary_button_widget.dart';
import 'package:posty/Features/posts/presentation/manager/app_cubit/cubit.dart';
import 'package:posty/Features/posts/presentation/manager/app_cubit/states.dart';
import 'package:posty/Features/posts/presentation/views/create_post/widgets/create_post_header_widget.dart';
import 'package:posty/core/network/network_cubit/cubit.dart';
import 'package:posty/core/network/network_cubit/states.dart';
import 'package:posty/core/shared/methods.dart';
import 'package:posty/core/utils/app_colors.dart';

class CreatePostBody extends StatelessWidget {
  const CreatePostBody({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final bodyController  = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocConsumer<ConnectivityCubit, ConnectivityStates>(
      listener: (BuildContext context, ConnectivityStates networkState) {  },
      builder: (BuildContext context, ConnectivityStates networkState)
      {
        return BlocConsumer<PostsCubit, PostsStates>(
          listener: (BuildContext context, PostsStates state)
          {
            if (state is CreatePostSuccessState)
            {
              ScaffoldMessenger.of(context).showSnackBar(showSnackBar('Post created successfully!',AppColors.greenColor,false,false),);
              Navigator.pop(context);
            }
            if (state is CreatePostErrorState)
            {
              ScaffoldMessenger.of(context).showSnackBar(showSnackBar('Failed to create post',AppColors.redColor,false,false),);
            }
          },
          builder: (BuildContext context, PostsStates state)
          {
            final cubit = PostsCubit.get(context);
            final isOnline = networkState is! ConnectivityOfflineState;

            if (state is CreatePostLoadingState)
            {
              return const Center(child: CircularProgressIndicator(color: AppColors.appPrimaryColor),);
            }

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CreatePostHeaderWidget(),
                    const SizedBox(height: 24),
                    Field(
                      controller: titleController,
                      label: 'Title',
                      hint: 'Enter ur post title',
                      icon: Icons.title_rounded,
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return 'enter a title';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Field(
                      controller: bodyController,
                      label: 'Content',
                      hint: 'Write ur post content here...',
                      isTextArea: true,
                    ),
                    const SizedBox(height: 32),
                    isOnline?
                    PrimaryButton(
                      label: 'Publish Post',
                      onTap: ()
                      {
                        if (formKey.currentState!.validate())
                        {
                          cubit.createPost(title: titleController.text, body: bodyController.text);
                        }
                      },
                    ):Opacity(opacity:0.5,child: PrimaryButton(label: 'Publish Post', onTap: () {},)),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ) ;
      },
    );
  }
}
