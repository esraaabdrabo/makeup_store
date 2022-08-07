import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/view_model/shopping_cart.dart';

import '../view_model/home.dart';
import '../widgets/commonWidgets.dart';
import 'products.dart/category_products.dart';
import 'package:store/myThemeData.dart';
import 'drawer.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> categories = HomeVM.categories;
    ShoppingCartVM shoppingCartProvider = Provider.of(context);
    return Scaffold(
      drawer: const RedDrawer(),
      appBar: CommonWidgets.appBAR(
          context, shoppingCartProvider.itemsNum.toString()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            CommonWidgets.pageTitle(context, 'Categories'),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            Container(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * .06),
                decoration: myThemeData.gridViewDecoration(context),
                child: categoriesNamesgridView(categories))
          ],
        ),
      ),
    );
  }
}

GridView categoriesNamesgridView(List<String> categories) {
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, mainAxisSpacing: 50, crossAxisSpacing: 50),
    itemCount: categories.length,
    itemBuilder: (context, index) {
      return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryProducts(categories[index]),
                ));
          },
          child: CommonWidgets.brandNameBtn(context, categories[index]));
    },
  );
}
