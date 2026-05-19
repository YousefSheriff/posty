import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posty/core/utils/app_routes.dart';

void navigateToAuthScreen (BuildContext context)
{
  Future.delayed(const Duration(milliseconds: 5800), ()
  {
    GoRouter.of(context).go(AppRoutes.auth);
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



SnackBar showSnackBar(String message,Color color,bool withIcon,bool withDuration)
{
  return SnackBar(
    duration: withDuration ? Duration(days: 1) : Duration(seconds: 3),
    backgroundColor: color,
    content: Row(
      children: [
        if (withIcon)
          Icon(Icons.wifi_off, color: Colors.white, size: 18),
        if (withIcon)
          SizedBox(width: 10),
        Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}