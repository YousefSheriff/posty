import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:posty/Features/auth/presentation/manager/login_cubit/cubit.dart';
import 'package:posty/Features/auth/presentation/manager/login_cubit/states.dart';
import 'package:posty/Features/auth/presentation/views/login/widgets/calling_login_button_widget.dart';
import 'package:posty/Features/auth/presentation/views/login/widgets/calling_fields_widget.dart';
import 'package:posty/Features/auth/presentation/views/login/widgets/divider_widget.dart';
import 'package:posty/Features/auth/presentation/views/widgets/footer_widget.dart';
import 'package:posty/Features/auth/presentation/views/login/widgets/options_social_row_widget.dart';
import 'package:posty/Features/auth/presentation/views/widgets/header_widget.dart';
import 'package:posty/Features/auth/presentation/views/login/widgets/social_row_widget.dart';
import 'package:posty/core/local/cache_helper.dart';
import 'package:posty/core/network/network_cubit/cubit.dart';
import 'package:posty/core/network/network_cubit/states.dart';
import 'package:posty/core/shared/methods.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_routes.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController    = TextEditingController();
    final passwordController = TextEditingController();
    final formKey            = GlobalKey<FormState>();

    return BlocProvider(
      create: (context)
      {
        return LoginCubit();
      },
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state)
        {
          if (state is LoginSuccessState)
          {
            CacheHelper.saveData(key: 'uId', value: state.uId).then((value)
            {
              uId = state.uId;
              showToast(message: "Login Successfully", state: ToastStates.SUCCESS);
              GoRouter.of(context).go(AppRoutes.homePosts);
            });
            GoRouter.of(context).go(AppRoutes.homePosts);
          }
          else if (state is LoginErrorState)
          {
            showToast(message: "Plz enter right data", state: ToastStates.ERROR);
          }
        },
        builder: (context, state)
        {
          final cubit = LoginCubit.get(context);

          return BlocConsumer<ConnectivityCubit, ConnectivityStates>(

              listener: (context, state)
              {
                if (state is ConnectivityOfflineState)
                {
                  final messenger = ScaffoldMessenger.of(context);
                  messenger.hideCurrentSnackBar();
                  messenger.showSnackBar(showSnackBar('No internet connection',AppColors.wifiError,true,true),);
                }
                else if (state is ConnectivityOnlineState)
                {
                  final messenger = ScaffoldMessenger.of(context);
                  messenger.hideCurrentSnackBar();
                }
              },
            builder: (context, networkState)
            {
              final isOnline = networkState is! ConnectivityOfflineState;

              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderWidget(
                        emoji: '👋',
                        title: 'Welcome Back!',
                        subtitle: 'Login now to share ur posts',
                      ),
                      LoginFieldsWidget(
                        emailController: emailController,
                        passwordController: passwordController,
                        cubit: cubit,
                      ),
                      const SizedBox(height: 12),
                      LoginOptionsRowWidget(cubit: cubit),
                      const SizedBox(height: 28),
                      LoginButtonWidget(
                        state: state,
                        onLoginPressed: isOnline ? ()
                        {
                          if (formKey.currentState!.validate())
                          {
                            cubit.userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        } : null,
                      ),
                      const SizedBox(height: 24),
                      const LoginOrDividerWidget(),
                      const SizedBox(height: 20),
                      const LoginSocialRowWidget(),
                      const SizedBox(height: 32),
                      FooterWidget(
                        firstText: 'Do not have an account?   ',
                        secondText: 'Register now',
                        onPressed: () {
                          GoRouter.of(context).pushReplacement(AppRoutes.register);
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}