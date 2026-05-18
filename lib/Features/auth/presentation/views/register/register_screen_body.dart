import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posty/Features/auth/presentation/manager/register_cubit/cubit.dart';
import 'package:posty/Features/auth/presentation/manager/register_cubit/states.dart';
import 'package:posty/Features/auth/presentation/views/login/login_screen.dart';
import 'package:posty/Features/auth/presentation/views/register/widgets/calling_register_button_widget.dart';
import 'package:posty/Features/auth/presentation/views/widgets/footer_widget.dart';
import 'package:posty/Features/auth/presentation/views/widgets/header_widget.dart';
import 'package:posty/Features/auth/presentation/views/register/widgets/register_fields_widget.dart';
import 'package:posty/core/shared/methods.dart';



class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var  nameController =TextEditingController();
    var  emailController = TextEditingController();
    var  phoneController = TextEditingController();
    var  passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return  BlocProvider(
      create: (BuildContext context) {
        return RegisterCubit();
      },
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (BuildContext context, RegisterStates state) {

          if(state is CreateUserSuccessState )
          {
            print("sucsesssssssssssssssssssssssssssssssss");
            showToast(message: "Register Successfully", state: ToastStates.SUCCESS);
            // navigateAndFinish(context,  MainScaffold(),);
          }
          else if(state is RegisterErrorState)
          {
            showToast(message: "Failed to create ur account", state: ToastStates.ERROR);
          }
          
          
        },
        builder: (BuildContext context, RegisterStates state)
        {
          RegisterCubit cubit = RegisterCubit.get(context);
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderWidget(emoji: '👤', title: 'Ur personal info', subtitle: 'Tell us more about u'),
                  RegisterFieldsWidget(nameController: nameController, emailController: emailController, phoneController: phoneController, passwordController: passwordController,cubit: cubit,),
                  const SizedBox(height: 28),
                  RegisterButtonWidget(
                      state: state, 
                      onRegisterPressed: ()
                      {
                        if(formKey.currentState!.validate())
                        {
                          cubit.userRegister(name: nameController.text, email: emailController.text, phone: phoneController.text, password: passwordController.text);
                        }
                        
                      }),
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
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
