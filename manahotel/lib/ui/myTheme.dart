import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier{
  bool isDark = false;
  Color color1 = const Color(0xFFF2F2F3);
  Color color2 = const Color(0xFFFDFDFE);
  Color color3 = const Color(0xFFABABAC);
  Color color4 = const Color(0xFFEBCBED);
  Color color5 = const Color(0xFFCBE8ED);
  Color color6 = const Color(0xFFD7D7D8);
  Color color7 = const Color(0xFFFDA0A1);
  Color color8 = const Color(0xFF000001);
  Color color9 = const Color(0xFFBABABB);

  setTheme(bool isDark){
    if(!isDark){
      color1 = const Color(0xFFF2F2F3);
      color2 = const Color(0xFFFDFDFE);
      color3 = const Color(0xFFABABAC);
      color4 = const Color(0xFFEBCBED);
      color5 = const Color(0xFFCBE8ED);
      color6 = const Color(0xFFD7D7D8);
      color7 = const Color(0xFFFDA0A1);
      color8 = const Color(0xFF000001);
      color9 = const Color(0xFFBABABB);
    }else{
      color1 = const Color(0xFF181819);
      color2 = const Color(0xFF1F1F20);
      color3 = const Color(0xFF404041);
      color4 = const Color(0xFF691B6C);
      color5 = const Color(0xFF1D5E68);
      color6 = const Color(0xFF656566);
      color7 = const Color(0xFF6E1819);
      color8 = const Color(0xFFFDFDFE);
      color9 = const Color(0xFFBABABB);
    }
    notifyListeners();
  }
}