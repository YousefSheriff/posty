import 'package:flutter/material.dart';
import 'package:posty/Features/auth/presentation/views/widgets/logo_and_app_name_widget.dart';
import 'package:posty/Features/auth/presentation/views/widgets/outline_button_widget.dart';
import 'package:posty/Features/auth/presentation/views/widgets/primary_button_widget.dart';


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

            // Buttons
            PrimaryButton(
              label: 'Login',
              onTap: () {

              },
            ),
            const SizedBox(height: 14),
            OutlineButton(
              label: 'Register',
              onTap: () {

              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
