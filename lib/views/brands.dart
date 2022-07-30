import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CommonWidgets.brandCircle(context, 'Brands'),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: brands.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  BrandProducts(brands[index]))));
                    },
                    child: CommonWidgets.brandNameBtn(context, brands[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}
