import 'package:flutter/material.dart';

class AppColors {
  static const Color whiteColor        = Colors.white;
  static const Color blackColor        = Colors.black;
  static       Color wifiError         = Colors.red.shade700;
  static const Color greenColor        = Colors.green;
  static const Color greyColor         = Colors.grey;
  static const Color redColor          = Colors.red;
  static const Color appPrimaryColor   = Color(0xFF7C6FF7);
  static const Color appSplashNameColor= Color(0xFF3B3285);
  static const Color appPrimaryLightColor = Color(0xFFEEEBFF);
  static const Color errorFieldColor   = Color(0xFFE53935);
  static const Color googleLogoColor   = Color(0xFFEA4335);
  static const Color facebookLogoColor = Color(0xFF1877F2);
  static const Color backgroundColor       = Color(0xFFF5F4FB);
  static const Color cardColor             = Color(0xFFFFFFFF);
  static const Color textPrimaryColor      = Color(0xFF2D2D3A);
  static const Color textSecondaryColor    = Color(0xFF9B9BAD);
  static const Color borderColor           = Color(0xFFE8E8F0);
  static const Color darkBackgroundColor   = Color(0xFF121212);
  static const Color darkCardColor         = Color(0xFF1E1E2E);
  static const Color darkTextPrimaryColor  = Color(0xFFEAEAEA);
  static const Color darkTextSecondaryColor= Color(0xFF8A8A9A);
  static const Color darkBorderColor       = Color(0xFF2E2E3E);

  static Color backGround(bool isDark)
  {
    if(isDark)
    {return darkBackgroundColor;}
    else
    {return backgroundColor;}
  }
  static Color card(bool isDark)
  {
    if(isDark)
    {return darkCardColor;}
    else
    {return cardColor;}

  }
  static Color textPrimary(bool isDark)
  {
    if(isDark)
    {return darkTextPrimaryColor;}
    else
    {return textPrimaryColor;}
  }
  static Color textSecondary(bool isDark)
  {
    if(isDark)
    {return darkTextSecondaryColor;}
    else
    {return textSecondaryColor;}
  }
  static Color border(bool isDark)
  {
    if(isDark)
    {return darkBorderColor;}
    else
    {return borderColor;}
  }
}
