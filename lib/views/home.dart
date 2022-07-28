import 'package:flutter/material.dart';
import 'package:store/myThemeData.dart';
import 'package:store/view_model/home.dart';
import 'package:store/views/Home_Fragment/brands.dart';
import 'package:store/views/Home_Fragment/categories.dart';
import 'package:store/views/brand.dart';
import 'package:store/views/category.dart';
import 'package:store/widgets/commonWidgets.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int index = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: index == 0 ? const Categories() : const Brands(),
      bottomNavigationBar: BottomNavigationBar(
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
