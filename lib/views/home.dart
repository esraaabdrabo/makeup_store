/*import 'package:flutter/material.dart';
import 'package:store/myThemeData.dart';
import 'package:store/views/Home_Fragment/brands.dart';
import 'package:store/views/Home_Fragment/categories.dart';
import 'package:store/widgets/commonWidgets.dart';

import 'drawer.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int index = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const RedDrawer(),
      extendBody: true,
      appBar: CommonWidgets.appBAR(),
      body: const Brands(),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Categoriess'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Brands')
          ]),
    );
  }
}
*/