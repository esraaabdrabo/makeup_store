import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/myThemeData.dart';
import 'package:store/view_model/favourite.dart';
import 'package:store/view_model/shopping_cart.dart';
import 'package:store/views/drawer.dart';
import 'package:store/widgets/commonWidgets.dart';

class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavouriteVM provider = Provider.of(context);
    List<Product> favList = provider.favList;
    ShoppingCartVM shoppingCartProvider = Provider.of(context);

    return Scaffold(
      backgroundColor: myThemeData.movcolor,
      drawer: const RedDrawer(),
      appBar: CommonWidgets.appBAR(
          context, shoppingCartProvider.itemsNum.toString()),
      body: favList.isEmpty
          ? const Center(child: Text('empty'))
          : Column(
              children: [
                Expanded(
                  child: CommonWidgets.productsListView(
                      favList, shoppingCartProvider, provider, context),
                ),
              ],
            ),
    );
  }
}
