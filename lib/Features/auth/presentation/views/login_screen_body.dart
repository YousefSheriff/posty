import 'package:flutter/material.dart';
import 'package:posty/Features/auth/presentation/views/widgets/calling_button_widget.dart';
import 'package:posty/Features/auth/presentation/views/widgets/calling_fields_widget.dart';
import 'package:posty/Features/auth/presentation/views/widgets/divider_widget.dart';
import 'package:posty/Features/auth/presentation/views/widgets/footer_widget.dart';
import 'package:posty/Features/auth/presentation/views/widgets/options_social_row_widget.dart';
import 'package:posty/Features/auth/presentation/views/widgets/login_header_widget.dart';
import 'package:posty/Features/auth/presentation/views/widgets/social_row_widget.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});


  @override
  Widget build(BuildContext context)
  {
    final emailController   = TextEditingController();
    final passwordController    = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            LoginHeader(emoji: '👋', title: 'Welcome Back!', subtitle: 'Login now to share ur posts',),
            LoginFieldsWidget(emailController: emailController, passwordController: passwordController,),
            const SizedBox(height: 12),
            LoginOptionsRowWidget(),
            const SizedBox(height: 28),
            LoginButtonWidget(onLoginPressed: () {},),
            const SizedBox(height: 24),
            const OrDivider(),
            const SizedBox(height: 20),
            const SocialRow(),
            const SizedBox(height: 32),
            const LoginFooterWidget(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

}
