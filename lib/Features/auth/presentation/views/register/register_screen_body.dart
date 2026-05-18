import 'package:flutter/material.dart';
import 'package:posty/Features/auth/presentation/views/login/login_screen.dart';
import 'package:posty/Features/auth/presentation/views/widgets/footer_widget.dart';
import 'package:posty/Features/auth/presentation/views/widgets/header_widget.dart';
import 'package:posty/Features/auth/presentation/views/register/widgets/register_fields_widget.dart';
import 'package:posty/Features/auth/presentation/views/widgets/primary_button_widget.dart';



class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return  Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(emoji: '👤', title: 'Ur personal info', subtitle: 'Tell us more about u'),
              RegisterFieldsWidget(),
              const SizedBox(height: 28),
              PrimaryButton(label: 'Register',onTap: () {},),
              const SizedBox(height: 24),
              FooterWidget(firstText: 'Have an account?  ', secondText: 'Login now', onPressed: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_)
                      {
                        return const LoginScreen();
                      }),
                );
              },),
            ],
          ),
        ),
      ),
    );
  }
}



