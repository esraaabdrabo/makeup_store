import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/myThemeData.dart';
import 'package:store/views/products.dart/brand_products.dart';

import '../view_model/home.dart';
import '../view_model/shopping_cart.dart';
import '../widgets/commonWidgets.dart';
import 'drawer.dart';

class Brands extends StatelessWidget {
  const Brands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShoppingCartVM shoppingCartProvider = Provider.of(context);

    List<String> brands = HomeVM.brands;

    return Scaffold(
      drawer: const RedDrawer(),
      extendBody: true,
      appBar: CommonWidgets.appBAR(
          context, shoppingCartProvider.itemsNum.toString()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            CommonWidgets.pageTitle(context, 'Brands'),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            Container(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * .06),
                decoration: myThemeData.gridViewDecoration(context),
                child: brandNamesgridView(brands)),
          ],
        ),
      ),
    );
  }
}

GridView brandNamesgridView(List<String> brands) {
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, mainAxisSpacing: 50, crossAxisSpacing: 50),
    itemCount: brands.length,
    itemBuilder: (context, index) {
      return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => BrandProducts(brands[index]))));
          },
          child: CommonWidgets.brandNameBtn(context, brands[index]));
    },
  );
}
