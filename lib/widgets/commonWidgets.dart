import 'package:flutter/material.dart';
import 'package:store/myThemeData.dart';

int colorIndex = 0;

class CommonWidgets {
  static Widget drawerRow(
      BuildContext context, Function() navigateFun, String title, Icon icon) {
    return Container(
      color: myThemeData.coffecolor,
      padding: const EdgeInsets.all(25),
      child: InkWell(
          onTap: navigateFun,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), icon],
          )),
    );
  }

  static PreferredSizeWidget appBAR() {
    return AppBar(
        backgroundColor: myThemeData.themeData.colorScheme.secondary,
        title: Text(
          'Royal',
          style: TextStyle(letterSpacing: 2, shadows: myThemeData.appbarShadow),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100))),
        elevation: 15,
        shadowColor: const Color.fromARGB(210, 255, 95, 170));
  }

  static Widget brandCircle(BuildContext context, String title) {
    return Container(
      width: MediaQuery.of(context).size.width * .32,
      height: MediaQuery.of(context).size.height * .15,
      decoration: const BoxDecoration(
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
          borderRadius: const BorderRadius.all(Radius.circular(100))),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              letterSpacing: 2,
              shadows: [BoxShadow(color: Color(0xff906C6C))]),
        ),
      ),
    );
  }

  static Widget brandNameBtn(BuildContext context, String name) {
    Color colorGenerate() {
      if (colorIndex == 0) {
        colorIndex++;

        return myThemeData.bluecolor;
      } else if (colorIndex == 1) {
        colorIndex++;
        return myThemeData.coffecolor;
      } else if (colorIndex == 2) {
        colorIndex++;
        return myThemeData.movcolor;
      } else {
        colorIndex = 0;
        return myThemeData.darkRedColor;
      }
    }

    return Container(
      width: MediaQuery.of(context).size.width * .25,
      height: MediaQuery.of(context).size.height * .07,
      decoration: BoxDecoration(
        color: colorGenerate(),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(255, 125, 124, 124),
              blurRadius: 2,
              offset: Offset(1, 0)),
          BoxShadow(
              color: Color.fromARGB(255, 203, 197, 197),
              blurRadius: 2,
              offset: Offset(-1, 0))
        ],
      ),
      child: Container(
          padding: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width * .1,
          child: Center(
              child: Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 23, color: Color.fromARGB(255, 255, 255, 255)),
          ))),
    );
  }
}
