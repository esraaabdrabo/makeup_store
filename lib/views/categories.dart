import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/view_model/shopping_cart.dart';

import '../view_model/home.dart';
import '../widgets/commonWidgets.dart';
import 'products.dart/category_products.dart';
import 'drawer.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> categories = HomeVM.categories;
    ShoppingCartVM shoppingCartProvider = Provider.of(context);
    return Scaffold(
      drawerScrimColor: Colors.amber,
      drawer: const RedDrawer(),
      extendBody: true,
      appBar: CommonWidgets.appBAR(
          context, shoppingCartProvider.itemsNum.toString()),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CommonWidgets.brandCircle(context, 'Categories'),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CategoryProducts(categories[index]),
                          ));
                    },
                    child:
                        CommonWidgets.brandNameBtn(context, categories[index]));
              },
            ),
          )
        ],
      ),
    );
  }
}
