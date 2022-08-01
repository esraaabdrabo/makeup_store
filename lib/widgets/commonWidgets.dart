import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:store/myThemeData.dart';
import 'package:store/view_model/product_details.dart';

import '../models/product.dart';
import '../view_model/favourite.dart';
import '../view_model/shopping_cart.dart';

int colorIndex = 0;

class CommonWidgets {
  static Widget drawerRow(
      BuildContext context, Function() navigateFun, String title, Icon icon) {
    return Container(
      color: myThemeData.coffecolor,
      padding: const EdgeInsets.all(25),
      child: InkWell(
          onTap: navigateFun,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), icon],
          )),
    );
  }

  static PreferredSizeWidget appBAR(BuildContext context, String itemsNum) {
    return AppBar(
        iconTheme:
            IconThemeData(color: myThemeData.themeData.colorScheme.secondary),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //shopping cart
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Text(
                      itemsNum,
                      style: TextStyle(color: myThemeData.bluecolor),
                    ),
                    const Icon(Icons.shopping_cart),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
                width: MediaQuery.of(context).size.width * .06,
                child:
                    VerticalDivider(color: myThemeData.bluecolor, thickness: 3),
              ),
              InkWell(onTap: () {}, child: const Icon(Icons.person)),

              SizedBox(width: MediaQuery.of(context).size.width * .08),
              // MediaQuery.of(context).size.width*.05,)
            ],
          )
        ],
        backgroundColor: Colors.white,
        title: Text(
          'Royal',
          style: TextStyle(
              letterSpacing: 2,
              color: myThemeData.themeData.colorScheme.secondary,
              shadows: myThemeData.appbarShadow),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100))),
        elevation: 15,
        shadowColor: const Color.fromARGB(210, 255, 95, 170));
  }

  static Widget brandCircle(BuildContext context, String title) {
    return Container(
      width: MediaQuery.of(context).size.width * .32,
      height: MediaQuery.of(context).size.height * .15,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(146, 125, 124, 124),
                blurRadius: 12,
                offset: Offset(-15, 15))
          ],
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 251, 61, 93),
                Color.fromARGB(255, 165, 49, 49),
                Color.fromARGB(255, 34, 4, 4)
              ]),
          borderRadius: BorderRadius.all(Radius.circular(100))),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              letterSpacing: 2,
              shadows: [BoxShadow(color: Color(0xff906C6C))]),
        ),
      ),
    );
  }

  static Widget brandNameBtn(BuildContext context, String name) {
    Color colorGenerate() {
      if (colorIndex == 0) {
        colorIndex++;

        return myThemeData.bluecolor;
      } else if (colorIndex == 1) {
        colorIndex++;
        return myThemeData.coffecolor;
      } else if (colorIndex == 2) {
        colorIndex++;
        return myThemeData.movcolor;
      } else {
        colorIndex = 0;
        return myThemeData.darkRedColor;
      }
    }

    return Container(
      width: MediaQuery.of(context).size.width * .25,
      height: MediaQuery.of(context).size.height * .07,
      decoration: BoxDecoration(
        color: colorGenerate(),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(255, 125, 124, 124),
              blurRadius: 2,
              offset: Offset(1, 0)),
          BoxShadow(
              color: Color.fromARGB(255, 203, 197, 197),
              blurRadius: 2,
              offset: Offset(-1, 0))
        ],
      ),
      child: Container(
          padding: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width * .1,
          child: Center(
              child: Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 23, color: Color.fromARGB(255, 255, 255, 255)),
          ))),
    );
  }

  static Widget prodNamePrice(BuildContext context, String name, String price) {
    return Column(
      children: [
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        Divider(
          color: myThemeData.coffecolor,
          endIndent: 50,
          indent: 50,
          height: MediaQuery.of(context).size.height * .02,
        ),
        //price
        Text(
          '$price \$',
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 12, color: Color.fromARGB(148, 255, 255, 255)),
        ),
      ],
    );
  }

  static Widget prodImg(BuildContext context, String url) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      width: MediaQuery.of(context).size.width * .5,
      child: Image.network(
        'http:$url}',
        fit: BoxFit.fill,
      ),
    );
  }

  static Widget addRemoveRow(ShoppingCartVM shoppingCartProvider, int id,
      [bool isCicleBtnDec = false]) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //add icon
        Container(
          decoration: isCicleBtnDec ? myThemeData.circleBtnDec : null,
          child: IconButton(
              onPressed: () {
                shoppingCartProvider.addItem(id);
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              )),
        ),
        //order number
        Text(
          shoppingCartProvider.getproductOrderNum(id).toString(),
          style: const TextStyle(color: Colors.white),
        ),
//delete icon
        Container(
          decoration: isCicleBtnDec ? myThemeData.circleBtnDec : null,
          child: IconButton(
              onPressed: () {
                shoppingCartProvider.deleteItem(id);
              },
              icon: const Icon(
                Icons.remove,
                color: Colors.white,
              )),
        ),
      ],
    );
  }

  static Widget productsListView(
      List<Product> products,
      ShoppingCartVM shoppingCartProvider,
      FavouriteVM favProvider,
      BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              //upper white line
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * .02,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductDetails(products[index])));
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //product details
                      SizedBox(
                          width: MediaQuery.of(context).size.width * .4,
                          child: Column(
                            children: [
                              //name divider price
                              CommonWidgets.prodNamePrice(context,
                                  products[index].name, products[index].price),
                              //add , num of items in ordere , delete
                              CommonWidgets.addRemoveRow(
                                  shoppingCartProvider, products[index].id)
                            ],
                          )),
                      //product img and fav icon
                      Stack(children: [
                        CommonWidgets.prodImg(
                            context, products[index].apiFeaturedImage),
                        //fav
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .5,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                //fav icon
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100))),
                                  child: IconButton(
                                      onPressed: () {
                                        if (favProvider.favList
                                            .contains(products[index])) {
                                          favProvider.removeFromFav(
                                              products[index].id);
                                        } else {
                                          favProvider.addToFav(products[index]);
                                        }
                                      },
                                      icon: Icon(
                                        favProvider.favList
                                                .contains(products[index])
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Colors.red,
                                      )),
                                ),
                              ]),
                        ),
                      ])
                    ]),
              ),
              //lower white line
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * .02,
              )
            ],
          );
        });
  }
}
