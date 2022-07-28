import 'package:flutter/material.dart';

class myThemeData {
  ThemeData themeData = ThemeData(
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: const Color(0xffBB142E)),
      primaryColor: const Color(0xffF9F9F9));

  var brandBtnShadow = const Color(0xff000000).withOpacity(2);
  var brandTextBorder = const Color(0xff906C6C);
  var t = const BoxDecoration(
      gradient: LinearGradient(colors: [Color(0xffFF1D42), Color(0xff1B0000)]));
}
