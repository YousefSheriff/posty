import 'package:flutter/material.dart';
import 'package:posty/Features/splash/presentation/views/splash_screen.dart';

void navigationToAuthScreen (BuildContext context)
{
  // Navigate after animation + brief pause
  Future.delayed(const Duration(milliseconds: 5800), ()
  {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___)
        {
          return const SplashScreen();
        },
        transitionsBuilder: (_, anim, __, child) => FadeTransition(
          opacity: CurvedAnimation(parent: anim, curve: Curves.easeIn),
          child: child,
        ),
        transitionDuration: const Duration(milliseconds: 1000),
      ),
    );
  });
}
