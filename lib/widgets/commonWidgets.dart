import 'package:flutter/material.dart';
import 'package:store/myThemeData.dart';
import 'package:store/views/product_details.dart';
import 'package:store/views/shopping_cart.dart';

import '../models/product.dart';
import '../view_model/favourite.dart';
import '../view_model/shopping_cart.dart';

import 'package:google_fonts/google_fonts.dart';

class CommonWidgets {
  static Widget drawerRow(
      BuildContext context, Function() navigateFun, String title, Icon icon) {
    return Container(
      color: myThemeData.offWhightcolor,
      padding: const EdgeInsets.all(25),
      width: MediaQuery.of(context).size.width * .5,
      child: InkWell(
          onTap: navigateFun,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title,
                style: myThemeData.drawerBtnTextStyle,
              ),
              icon
            ],
          )),
    );
  }

  static PreferredSizeWidget appBAR(BuildContext context, String itemsNum) {
    return AppBar(
        iconTheme: IconThemeData(color: myThemeData.bluecolor),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //shopping cart
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ShoppingCart()));
                },
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
          style: myThemeData.logoTextStyle,
        ),
        centerTitle: true,
        /*  shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100))),*/
        elevation: 3,
        shadowColor: myThemeData.coffecolor);
  }

  static Widget brandCircle(BuildContext context, String title) {
    return Container(
      width: MediaQuery.of(context).size.width * .32,
      height: MediaQuery.of(context).size.height * .15,
      decoration: myThemeData.redCircleDecoration,
      child: Center(
        child: Text(title, style: myThemeData.redCircleTextStyle),
      ),
    );
  }

  static Widget brandNameBtn(BuildContext context, String name) {
    return Container(
        width: MediaQuery.of(context).size.width * .25,
        height: MediaQuery.of(context).size.height * .07,
        decoration: myThemeData.brandNameBtnDecoration,
        child: Container(
          padding: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width * .1,
          child: Center(
              child: Text(name,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.aBeeZee(
                    textStyle: const TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(166, 255, 255, 255)),
                  ))),
        ));
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
              fontSize: 12, color: Color.fromARGB(223, 255, 255, 255)),
        ),
      ],
    );
  }

  static Widget prodImg(BuildContext context, String url) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      width: MediaQuery.of(context).size.width * .5,
      height: MediaQuery.of(context).size.width * .5,
      child: Image.network(
        'http:$url}',
        fit: BoxFit.fill,
      ),
    );
  }

  static Widget addRemoveRow(
      BuildContext context,
      ShoppingCartVM shoppingCartProvider,
      int id,
      String colorName,
      String colorHexa,
      String imgUrl,
      [bool isCircleBtnDec = false]) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //add icon
        Container(
          height: MediaQuery.of(context).size.height * .04,
          width: MediaQuery.of(context).size.height * .04,
          decoration: isCircleBtnDec ? myThemeData.circleBtnDec : null,
          child: IconButton(
              onPressed: () {
                //         shoppingCartProvider.addItem(
                //           id, 'colorName', 'colorHexa', imgUrl);
                shoppingCartProvider.addToPieceNum(id);
              },
              icon: Icon(
                Icons.add,
                color: isCircleBtnDec ? myThemeData.movcolor : Colors.white,
                size: isCircleBtnDec ? 15 : 20,
              )),
        ),
        //order number
        Text(
          shoppingCartProvider.getproductOrderNum(id),
          style: const TextStyle(color: Colors.white),
        ),
//delete icon
        Container(
          height: MediaQuery.of(context).size.height * .04,
          width: MediaQuery.of(context).size.height * .04,
          decoration: isCircleBtnDec ? myThemeData.circleBtnDec : null,
          child: IconButton(
              onPressed: () {
                shoppingCartProvider.removeFromPieceNum(id);
                //   shoppingCartProvider.deleteItem(id);
              },
              icon: Icon(
                Icons.remove,
                color: isCircleBtnDec ? myThemeData.movcolor : Colors.white,
                size: isCircleBtnDec ? 15 : 20,
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
              //product details (img and texts)

              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductDetails(products[index])));
                },
                //product details (img and texts)

                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //product details (img and texts)
                      SizedBox(
                          width: MediaQuery.of(context).size.width * .4,
                          child: Column(
                            children: [
                              //name divider price
                              CommonWidgets.prodNamePrice(context,
                                  products[index].name, products[index].price),
//brand text
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Brand : ${products[index].brand}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color:
                                          Color.fromARGB(184, 255, 255, 255)),
                                ),
                              ),
                              //category text
                              Text(
                                'Category : ${products[index].category}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Color.fromARGB(184, 255, 255, 255)),
                              ),
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
