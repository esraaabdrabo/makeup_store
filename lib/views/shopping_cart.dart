import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/myThemeData.dart';
import 'package:store/view_model/shopping_cart.dart';
import 'package:store/views/drawer.dart';
import 'package:store/views/product_details.dart';
import 'package:store/widgets/commonWidgets.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShoppingCartVM shoppingCartProvider = Provider.of(context);
    List<Order> ordersList = shoppingCartProvider.ordersList;
    return Scaffold(
        backgroundColor: myThemeData.bluecolor,
        drawer: const RedDrawer(),
        appBar: CommonWidgets.appBAR(
            context, shoppingCartProvider.itemsNum.toString()),
        body: ordersList.isEmpty
            ? Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .6,
                  child: Text('shopping cart is empty',
                      textAlign: TextAlign.center,
                      style: myThemeData.emptyTextStyle),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 3,
                      );
                    },
                    itemCount: ordersList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(20),
                              child: InkWell(
                                onTap: () {
                                  Product clickedProduct = shoppingCartProvider
                                      .searchInAddedListWithId(
                                          ordersList[index].id);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetails(clickedProduct)));
                                },
                                child: Column(children: [
                                  Text(
                                    ordersList[index].name,
                                    style: myThemeData.shoppingCartTextStyle,
                                  ),
                                  Divider(
                                      color: myThemeData.bluecolor,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .03),
                                  //details row (img and texts)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            //selected  color container
                                            Row(
                                              children: [
                                                Text('Selected Color : ',
                                                    style: myThemeData
                                                        .shoppingCartTextStyle),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(int.parse(
                                                        ordersList[index]
                                                            .colorHexa)),
                                                    borderRadius: BorderRadius
                                                        .all(Radius.circular(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                .05)),
                                                  ),
                                                  padding: EdgeInsets.all(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .02),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .01,
                                            ),
                                            //selected  color name
                                            ordersList[index]
                                                        .colorName
                                                        .trim() !=
                                                    ''
                                                ? Text(
                                                    'Color Name : ${ordersList[index].colorName}',
                                                    style: myThemeData
                                                        .shoppingCartTextStyle,
                                                  )
                                                : Container(),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .01,
                                            ),
                                            //number of pieces
                                            Text(
                                              'Number Of Pieces : ${ordersList[index].num.toString()}',
                                              style: myThemeData
                                                  .shoppingCartTextStyle,
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .01,
                                            ),
                                            Text(
                                              'Price : ${ordersList[index].price} \$',
                                              style: myThemeData
                                                  .shoppingCartTextStyle,
                                            ),
                                            //delete icon

                                            Row(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 25),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: myThemeData
                                                              .darkRedColor),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        shoppingCartProvider
                                                            .deleteFromOrderList(
                                                                ordersList[index]
                                                                    .id,
                                                                ordersList[
                                                                        index]
                                                                    .colorHexa,
                                                                ordersList[
                                                                        index]
                                                                    .num);
                                                      },
                                                      icon: Icon(
                                                        Icons.delete,
                                                        size: 25,
                                                        color: myThemeData
                                                            .darkRedColor,
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      //img and btn co
                                      Container(
                                        color: Colors.white,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .3,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                .3,
                                        child: Image.network(
                                          'http:${ordersList[index].imgUrl}',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                              ),
                            ),
                            //Remove From Cart
                            index == ordersList.length - 1
                                ?
                                //total price
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      //total
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .15,
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: myThemeData.coffecolor
                                                    .withAlpha(100))),
                                        padding: const EdgeInsets.all(25),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text(
                                          'Total :  ${shoppingCartProvider.totalPrice} ',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      //check
                                      ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    myThemeData.offWhightcolor),
                                          ),
                                          //check out btn
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              //Check out
                                              Text(
                                                "Check out",
                                                style: TextStyle(
                                                    color:
                                                        myThemeData.bluecolor,
                                                    fontSize: 14,
                                                    letterSpacing: 2),
                                              ),

                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .05,
                                              ),
                                              Icon(
                                                Icons.check_outlined,
                                                size: 20,
                                                color: myThemeData.bluecolor,
                                              )
                                            ],
                                          ))
                                    ],
                                  )
                                : Container(),
                          ],
                        ),
                      );
                    })));
  }
}
