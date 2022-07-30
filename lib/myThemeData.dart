import 'package:flutter/material.dart';

class myThemeData {
  static ThemeData themeData = ThemeData(
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Color(0xffBB142E)),
      primaryColor: Color(0xffF9F9F9));

  var brandBtnShadow = const Color(0xff000000).withOpacity(2);
  var brandTextBorder = const Color(0xff906C6C);
  var t = const BoxDecoration(
      gradient: LinearGradient(colors: [Color(0xffFF1D42), Color(0xff1B0000)]));

  static List<BoxShadow> appbarShadow = const [
    BoxShadow(
        blurRadius: 7,
        offset: Offset(-100, 25),
        color: Color.fromARGB(211, 255, 218, 95)),
    BoxShadow(
        blurRadius: 8,
        offset: Offset(50, -25),
        color: Color.fromARGB(210, 146, 255, 95)),
    BoxShadow(
        blurRadius: 10,
        offset: Offset(130, 25),
        color: Color.fromARGB(210, 95, 154, 255)),
    BoxShadow(
        blurRadius: 10,
        offset: Offset(-130, -25),
        color: Color.fromARGB(210, 255, 95, 170)),
    BoxShadow(
        blurRadius: 10,
        offset: Offset(0, 10),
        color: Color.fromARGB(210, 255, 95, 199)),
    BoxShadow(
        blurRadius: 15,
        offset: Offset(120, -15),
        color: Color.fromARGB(210, 95, 255, 162))
  ];
  static Color orangecolor = const Color(0xffFF5B00);
  static Color coffecolor = const Color(0xffCA965C);
  static Color movcolor = const Color(0xff9C3D54);
  static Color bluecolor = const Color(0xffF676FA3);
  static Color darkRedColor = const Color(0xff911F27);
}
