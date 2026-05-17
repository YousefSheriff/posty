import 'package:flutter/material.dart';
import 'package:posty/Features/splash/presentation/views/widgets/app_name_widget.dart';
import 'package:posty/Features/splash/presentation/views/widgets/logo_widget.dart';
import 'package:posty/core/methods.dart';

class SplashScreenBody extends StatefulWidget
{
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Offset> appNameSlidingAnimation;

  @override
  void initState() {
    super.initState();
    initSplashAnimation();
    navigationToAuthScreen(context);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          const LogoWidget(),

          const SizedBox(height: 20),

          SlideTransition(
            position: appNameSlidingAnimation,
            child: const AppNameWidget(),
          ),
        ],
      ),
    );
  }



  void initSplashAnimation()
  {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    appNameSlidingAnimation = Tween<Offset>(
      begin: const Offset(0, 2.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.10, 1.0, curve: Curves.easeOutCubic),
      ),
    );
    animationController.forward();
  }

}

