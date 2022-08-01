import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/myThemeData.dart';
import 'package:store/view_model/brand.dart';
import 'package:store/view_model/favourite.dart';
import 'package:store/widgets/commonWidgets.dart';

import '../../view_model/shopping_cart.dart';

// ignore: must_be_immutable
class BrandProducts extends StatefulWidget {
  String brandName;
  BrandProducts(this.brandName, {Key? key}) : super(key: key);

  @override
  State<BrandProducts> createState() => _BrandProductsState();
}

class _BrandProductsState extends State<BrandProducts> {
  @override
  Widget build(BuildContext context) {
    ShoppingCartVM shoppingCartProvider = Provider.of(context);

    return ChangeNotifierProvider(
        create: (context) => FavouriteVM(),
        builder: (context, child) {
          FavouriteVM favProvider = Provider.of(context);
          return ChangeNotifierProvider(
              create: (context) => BrandVM(widget.brandName),
              builder: (context, child) {
                BrandVM provider = Provider.of(context);
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
