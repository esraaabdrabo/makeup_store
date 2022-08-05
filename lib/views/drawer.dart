import 'package:flutter/material.dart';
import 'package:store/myThemeData.dart';
import 'package:store/views/brands.dart';
import 'package:store/views/categories.dart';
import 'package:store/views/favourite.dart';
import 'package:store/widgets/commonWidgets.dart';
import 'shopping_cart.dart';

class RedDrawer extends StatelessWidget {
  const RedDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        //brand name
        SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Text('Royal',
                    style: myThemeData.logoTextStyle.copyWith(fontSize: 35)),
                Divider(
                  thickness: 2,
                  color: myThemeData.offWhightcolor,
                  indent: 100,
                  endIndent: 100,
                )
              ],
            ),
          ),
        ),
        //categories
        CommonWidgets.drawerRow(context, () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Categories()));
        },
            'Categories',
            Icon(
              Icons.category,
              color: myThemeData.movcolor,
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
        ),
        //Brands
        CommonWidgets.drawerRow(context, () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Brands()));
        },
            'Brands',
            const Icon(
              Icons.star,
              color: Colors.orangeAccent,
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
        ),
        //shopping cart
        CommonWidgets.drawerRow(context, () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ShoppingCart()));
        },
            'Shopping cart',
            const Icon(
              Icons.shopping_cart,
              color: Colors.green,
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
        ),
        //favourite
        CommonWidgets.drawerRow(context, () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Favourite()));
        },
            'Favorite',
            const Icon(
              Icons.favorite,
              color: Colors.red,
            ))
      ]),
    );
  }
}
