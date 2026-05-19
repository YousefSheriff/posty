import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:posty/Features/auth/presentation/views/main_auth/widgets/logo_and_app_name_widget.dart';
import 'package:posty/Features/auth/presentation/views/widgets/outline_button_widget.dart';
import 'package:posty/Features/auth/presentation/views/widgets/primary_button_widget.dart';
import 'package:posty/core/utils/app_routes.dart';


class MainAuthScreenBody extends StatelessWidget {
  const MainAuthScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            const Spacer(),
            const LogoAndAppNameWidget(),
            const Spacer(),

            PrimaryButton(
              label: 'Login',
              onTap: ()
              {
                GoRouter.of(context).push(AppRoutes.login);
              },
            ),
            const SizedBox(height: 14),
            OutlineButton(
              label: 'Register',
              onTap: ()
              {
                GoRouter.of(context).push(AppRoutes.register);
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
