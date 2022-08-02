import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/myThemeData.dart';
import 'package:store/view_model/brand.dart';
import 'package:store/view_model/category.dart';
import 'package:store/view_model/favourite.dart';
import 'package:store/widgets/commonWidgets.dart';

import '../../view_model/shopping_cart.dart';

// ignore: must_be_immutable
class CategoryProducts extends StatelessWidget {
  String brandName;
  CategoryProducts(this.brandName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShoppingCartVM shoppingCartProvider = Provider.of(context);

    return ChangeNotifierProvider(
        create: (context) => FavouriteVM(),
        builder: (context, child) {
          FavouriteVM favProvider = Provider.of(context);
          return ChangeNotifierProvider(
              create: (context) => CategoryVM(brandName),
              builder: (context, child) {
                CategoryVM provider = Provider.of(context);
                List<Product> products = provider.products;
                return Scaffold(
                    backgroundColor: myThemeData.movcolor,
                    appBar: CommonWidgets.appBAR(
                        context, shoppingCartProvider.itemsNum.toString()),
                    body: provider.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : CommonWidgets.productsListView(products,
                            shoppingCartProvider, favProvider, context));
              });
        });
  }
}
