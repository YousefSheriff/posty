import 'package:flutter/material.dart';
import 'package:posty/Features/splash/presentation/views/widgets/app_name_widget.dart';
import 'package:posty/Features/splash/presentation/views/widgets/logo_widget.dart';

class SplashScreenBody extends StatelessWidget{
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const LogoWidget(),
          const SizedBox(height: 15,),
          const AppNameWidget(),
        ],
      ),
    );
  }

}
