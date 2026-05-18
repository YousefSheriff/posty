import 'package:flutter/material.dart';
import 'package:posty/Features/auth/presentation/views/main_auth/auth_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

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



enum ToastStates{SUCCESS,WARNING,ERROR}
Color chooseColor(ToastStates state)
{
  Color ?color;
  switch(state)
  {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color ;
}



void showToast({
  required String? message,
  required ToastStates? state,
}) {
  Fluttertoast.showToast(
    msg: message.toString(),
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseColor(state!),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}



SnackBar showSnackBar()
{
  return SnackBar(
    duration: const Duration(days: 1),
    backgroundColor: Colors.red.shade700,
    content: const Row(
      children: [
        Icon(Icons.wifi_off, color: Colors.white, size: 18),
        SizedBox(width: 10),
        Text(
          'No internet connection',
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}