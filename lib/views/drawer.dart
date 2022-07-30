import 'package:flutter/material.dart';
import 'package:store/myThemeData.dart';
import 'package:store/views/Home_Fragment/brands.dart';
import 'package:store/views/Home_Fragment/categories.dart';
import 'package:store/widgets/commonWidgets.dart';

class RedDrawer extends StatelessWidget {
  const RedDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myThemeData.darkRedColor,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          child: const Padding(
            padding: EdgeInsets.only(top: 50),
            child: Text(
              'Royal',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
        CommonWidgets.drawerRow(context, () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Categories()));
        }, 'Categories', const Icon(Icons.category)),
        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
        ),
        CommonWidgets.drawerRow(context, () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Brands()));
        }, 'Brands', const Icon(Icons.category))
      ]),
    );
  }
}
