import 'package:flutter/material.dart';
import 'package:posty/Features/auth/presentation/views/login/widgets/form_field_widget.dart';
import 'package:posty/Features/posts/presentation/views/create_post/body_text_field_widget.dart';
import 'package:posty/Features/posts/presentation/views/create_post/widgets/create_post_header_widget.dart';

class CreatePostBody extends StatelessWidget {
  const CreatePostBody({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final bodyController  = TextEditingController();
    final formKey = GlobalKey<FormState>();

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
            BodyTextFieldWidget(controller: bodyController),
          ],
        ),
      ),
    );
  }
}
