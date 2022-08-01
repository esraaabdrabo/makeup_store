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
        backgroundColor: myThemeData.darkRedColor,
        appBar: CommonWidgets.appBAR(
            context, shoppingCartProvider.itemsNum.toString()),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                //img
                vertcalSpace(),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CommonWidgets.prodImg(
                        context, product.apiFeaturedImage)),
                vertcalSpace(), //name divder price
                CommonWidgets.prodNamePrice(
                    context, product.name, product.price),
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
                product.productColors.length > 0
                    ? Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .05,
                        child: Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: product.productColors.length,
                            itemBuilder: (context, index) {
                              List<ProductColors> colors =
                                  product.productColors;
                              String colorHexaString = '0xff' +
                                  colors[index]
                                      .hexValue
                                      .replaceAll(RegExp('#'), '');
                              int colorHexaInt = int.parse(colorHexaString);
                              return Container(
                                margin: EdgeInsets.all(
                                    MediaQuery.of(context).size.width * .01),
                                width: MediaQuery.of(context).size.width * .1,
                                decoration: BoxDecoration(
                                    color: Color(colorHexaInt),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(
                                      MediaQuery.of(context).size.height,
                                    ))),
                              );
                            },
                          ),
                        ),
                      )
                    : Container(),
                product.productColors.length > 0
                    ? vertcalSpace()
                    : Container(), //add remove row
                SizedBox(
                    width: MediaQuery.of(context).size.width * .4,
                    child: CommonWidgets.addRemoveRow(
                        shoppingCartProvider, product.id, true)),
                vertcalSpace(),
              ],
            ),
          ),
        ));
  }
}
