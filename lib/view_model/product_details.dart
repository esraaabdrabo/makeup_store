import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/myThemeData.dart';
import 'package:store/view_model/shopping_cart.dart';
import 'package:store/widgets/commonWidgets.dart';

class ProductDetails extends StatelessWidget {
  Product product;
  ProductDetails(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget vertcalSpace() {
      return SizedBox(
        height: MediaQuery.of(context).size.height * .05,
      );
    }

    ShoppingCartVM shoppingCartProvider = Provider.of(context);
    return Scaffold(
        backgroundColor: myThemeData.movcolor,
        appBar: CommonWidgets.appBAR(
            context, shoppingCartProvider.itemsNum.toString()),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //img
              vertcalSpace(),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child:
                      CommonWidgets.prodImg(context, product.apiFeaturedImage)),
              vertcalSpace(), //name divder price
              CommonWidgets.prodNamePrice(context, product.name, product.price),
              vertcalSpace(),
              //description
              SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: Text(product.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                    )),
              ),
              product.description != '' ? vertcalSpace() : Container(),
              //colors row
              product.productColors.isNotEmpty
                  ? Container(
                      color: const Color.fromARGB(112, 255, 255, 255),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .1,
                      child: Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: product.productColors.length,
                          itemBuilder: (context, index) {
                            List<ProductColors> colors = product.productColors;
                            String colorHexaString = '0xff' +
                                colors[index]
                                    .hexValue
                                    .replaceAll(RegExp('#'), '');
                            int colorHexaInt = int.parse(colorHexaString);
                            return InkWell(
                              onTap: () {
                                shoppingCartProvider.orderColorName =
                                    colors[index].colourName;

                                shoppingCartProvider.orderColorHexa =
                                    colorHexaString;
                              },
                              child: Container(
                                margin: EdgeInsets.all(
                                    MediaQuery.of(context).size.width * .01),
                                width: MediaQuery.of(context).size.width * .1,
                                decoration: BoxDecoration(
                                    color: Color(colorHexaInt),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(
                                      MediaQuery.of(context).size.height,
                                    ))),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : Container(),
              product.productColors.isNotEmpty
                  ? vertcalSpace()
                  : Container(), //add remove row
              SizedBox(
                  width: MediaQuery.of(context).size.width * .4,
                  child: CommonWidgets.addRemoveRow(
                      context, shoppingCartProvider, product.id, '', '', true)),
              vertcalSpace(),
              ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(
                        MediaQuery.of(context).size.width * .05)),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    shoppingCartProvider.addItem(
                        product.id,
                        shoppingCartProvider.orderColorName,
                        shoppingCartProvider.orderColorHexa);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ADD TO CART',
                        style: TextStyle(color: myThemeData.darkRedColor),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .03,
                      ),
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: myThemeData.darkRedColor,
                      )
                    ],
                  )),
            ],
          ),
        ));
  }
}
