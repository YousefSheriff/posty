import 'package:flutter/material.dart';
import 'package:posty/Features/auth/presentation/views/auth_screen.dart';

void navigationToAuthScreen (BuildContext context)
{
  Future.delayed(const Duration(milliseconds: 5800), ()
  {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, _, _)
        {
          return const AuthScreen();
        },
        transitionsBuilder: (_, anim, _, child) => FadeTransition(
          opacity: CurvedAnimation(parent: anim, curve: Curves.easeIn),
          child: child,
        ),
        transitionDuration: const Duration(milliseconds: 1000),
      ),
    );
  });
}
