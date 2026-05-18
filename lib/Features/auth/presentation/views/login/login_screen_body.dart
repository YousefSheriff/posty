import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posty/Features/auth/presentation/manager/login_cubit/cubit.dart';
import 'package:posty/Features/auth/presentation/manager/login_cubit/states.dart';
import 'package:posty/Features/auth/presentation/views/login/widgets/calling_button_widget.dart';
import 'package:posty/Features/auth/presentation/views/login/widgets/calling_fields_widget.dart';
import 'package:posty/Features/auth/presentation/views/login/widgets/divider_widget.dart';
import 'package:posty/Features/auth/presentation/views/login/widgets/footer_widget.dart';
import 'package:posty/Features/auth/presentation/views/login/widgets/options_social_row_widget.dart';
import 'package:posty/Features/auth/presentation/views/login/widgets/login_header_widget.dart';
import 'package:posty/Features/auth/presentation/views/login/widgets/social_row_widget.dart';
import 'package:posty/core/shared/methods.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});


  @override
  Widget build(BuildContext context)
  {
    final emailController   = TextEditingController();
    final passwordController    = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (BuildContext context) {
        return LoginCubit();
      },
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (BuildContext context, LoginStates state) {
          if(state is LoginSuccessState )
          {
            print("sucsesssssssssssssssssssssssssssssssss");
            showToast(message: "Login Successfully", state: ToastStates.SUCCESS);
            // navigateAndFinish(context,  MainScaffold(),);
          }
          else if(state is LoginErrorState)
          {
            showToast(message: "Plz enter right data", state: ToastStates.ERROR);
          }

        },
        builder: (BuildContext context, LoginStates state) {
          LoginCubit cubit = LoginCubit.get(context);
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  LoginHeaderWidget(emoji: '👋', title: 'Welcome Back!', subtitle: 'Login now to share ur posts',),
                  LoginFieldsWidget(emailController: emailController, passwordController: passwordController,cubit: cubit,),
                  const SizedBox(height: 12),
                  LoginOptionsRowWidget(cubit: cubit),
                  const SizedBox(height: 28),
                  LoginButtonWidget(
                    state: state,
                    onLoginPressed: ()
                  {
                    if(formKey.currentState!.validate())
                    {
                      cubit.userLogin(email: emailController.text, password: passwordController.text);
                    }
                  },
                  ),
                  const SizedBox(height: 24),
                  const LoginOrDividerWidget(),
                  const SizedBox(height: 20),
                  const LoginSocialRowWidget(),
                  const SizedBox(height: 32),
                  const LoginFooterWidget(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}
