import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//int colorIndex = 0;

class myThemeData {
  static ThemeData themeData = ThemeData(
    // primarySwatch: Colors.red,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Color(0xffBB142E)),
    primaryColor: const Color(0xffF9F9F9),
  );

  static TextStyle logoTextStyle = GoogleFonts.encodeSansSc(
    textStyle: TextStyle(letterSpacing: 2, color: myThemeData.bluecolor
        //  shadows: myThemeData.appbarShadow
        ),
  );
  static TextStyle drawerBtnTextStyle = GoogleFonts.k2d(
    textStyle:
        TextStyle(fontSize: 14, color: myThemeData.bluecolor, letterSpacing: 1),
  );
  static TextStyle pageTitle = GoogleFonts.k2d(
    textStyle: TextStyle(
        letterSpacing: 2,
        color: myThemeData.bluecolor,
        fontSize: 35,
        fontWeight: FontWeight.bold,
        shadows: const [
          BoxShadow(
              color: Color.fromARGB(134, 254, 231, 230),
              offset: Offset(-12, 11),
              blurRadius: 5)
        ]),
  );
  static TextStyle emptyTextStyle = GoogleFonts.aBeeZee(
      textStyle: const TextStyle(color: Colors.white, fontSize: 35));
  static TextStyle shoppingCartTextStyle = GoogleFonts.aBeeZee(
    textStyle:
        TextStyle(color: myThemeData.bluecolor, fontSize: 12, letterSpacing: 1),
  );
  static BoxDecoration redCircleDecoration = const BoxDecoration(
      boxShadow: [
        BoxShadow(
            color: Color.fromARGB(146, 125, 124, 124),
            blurRadius: 12,
            offset: Offset(-15, 15))
      ],
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 251, 61, 93),
            Color.fromARGB(255, 165, 49, 49),
            Color.fromARGB(255, 34, 4, 4)
          ]),
      borderRadius: BorderRadius.all(Radius.circular(100)));
  /* static Color colorGenerate() {
    if (colorIndex % 2 == 0) {
      colorIndex++;

      return myThemeData.bluecolor;
    } else {
      colorIndex++;
      return myThemeData.darkRedColor;
    }

    /*if (colorIndex == 1) {
        colorIndex++;
        return Colors.brown[300]!;
      } else if (colorIndex == 2) {
        colorIndex++;
        return myThemeData.movcolor;
      } else {
        colorIndex = 0;
        return myThemeData.darkRedColor;
      }*/
  }*/

  static BoxDecoration brandNameBtnDecoration = BoxDecoration(
    color: bluecolor,
    boxShadow: const [
      BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 0)),
      BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(-1, 0)),
      BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(0, 1)),
      BoxShadow(color: Colors.white, blurRadius: 5, offset: Offset(0, -1))
    ],
  );

  var brandBtnShadow = const Color(0xff000000).withOpacity(2);
  var brandTextBorder = const Color(0xff906C6C);
  var t = const BoxDecoration(
      gradient: LinearGradient(colors: [Color(0xffFF1D42), Color(0xff1B0000)]));

  static Color orangecolor = const Color(0xffFF5B00);
  //static Color offWhightcolor = const Color.fromARGB(255, 247, 229, 163);

  //in products details coffecolor is using with divider under the
  //product name
  static Color coffecolor = const Color(0xffCA965C);

  //static Color movcolor = const Color(0xff9C3D54);
  static Color bluecolor = const Color(0xffF676FA3);
  static Color darkRedColor = const Color(0xff911F27);

  static Color roseColor = const Color(0xffFEE7E6);
  static Color mintGreenColor = const Color.fromARGB(255, 247, 251, 248);
  //used in add remove item row
  static BoxDecoration circleBtnDec = const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(100)),
    color: Color.fromARGB(151, 255, 255, 255),
  );
//
  static BoxDecoration gridViewDecoration(BuildContext context) {
    return BoxDecoration(
      border: Border.all(
          color: myThemeData.bluecolor,
          width: MediaQuery.of(context).size.width * .04),
      borderRadius: BorderRadius.all(
          Radius.circular(MediaQuery.of(context).size.width * .08)),
      color: myThemeData.roseColor,
    );
  }
}
