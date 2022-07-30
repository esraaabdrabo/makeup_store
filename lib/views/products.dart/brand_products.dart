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
  bool isfav = false;
  var num = 0;

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
                        : ListView.builder(
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .02,
                                  ),
                                  //upper white line
                                  Container(
                                    color: Colors.white,
                                    height: MediaQuery.of(context).size.height *
                                        .02,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          //product details
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .4,
                                              child: Column(
                                                children: [
                                                  //name divider price
                                                  CommonWidgets.prodNamePrice(
                                                      context,
                                                      products[index].name,
                                                      products[index].price),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      //shooping cart
                                                      InkWell(
                                                          onTap: () {
                                                            shoppingCartProvider
                                                                .addItem(products[
                                                                        index]
                                                                    .id);

                                                            shoppingCartProvider
                                                                .ordersList
                                                                .forEach(
                                                                    (element) {
                                                              if (element.id ==
                                                                  products[
                                                                          index]
                                                                      .id) {
                                                                num =
                                                                    element.num;
                                                                print(element
                                                                    .num);
                                                                setState(() {});
                                                              } else {
                                                                num = 1;
                                                              }
                                                            });
                                                          },
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                num.toString(),
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              const Icon(
                                                                Icons
                                                                    .add_shopping_cart,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ],
                                                          )),
                                                      //fav
                                                      IconButton(
                                                          onPressed: () {
                                                            if (favProvider
                                                                .favList
                                                                .contains(
                                                                    products[
                                                                        index])) {
                                                              return;
                                                            }
                                                            favProvider
                                                                .addToFav(
                                                                    products[
                                                                        index]);
                                                          },
                                                          icon: Icon(
                                                            favProvider.favList
                                                                    .contains(
                                                                        products[
                                                                            index])
                                                                ? Icons.favorite
                                                                : Icons
                                                                    .favorite_border,
                                                            color: Colors.white,
                                                          )),
                                                    ],
                                                  )
                                                ],
                                              )),
                                          //product img
                                          CommonWidgets.prodImg(context,
                                              products[index].apiFeaturedImage)
                                        ]),
                                  ),
                                  //lower white line
                                  Container(
                                    color: Colors.white,
                                    height: MediaQuery.of(context).size.height *
                                        .02,
                                  )
                                ],
                              );
                            }));
              });
        });
  }
}
