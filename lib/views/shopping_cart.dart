import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        drawer: RedDrawer(),
        appBar: CommonWidgets.appBAR(
            context, shoppingCartProvider.itemsNum.toString()),
        body: ordersList.isEmpty
            ? const Center(
                child: Text(
                  'shopping cart is empty',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
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
                      return InkWell(
                          onTap: () {
                            Product clickedProduct = shoppingCartProvider
                                .searchInAddedListWithId(ordersList[index].id);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetails(clickedProduct)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                //details row (img and texts)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .6,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //selected  color container
                                          Row(
                                            children: [
                                              const Text('Selected Color : '),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Color(int.parse(
                                                      ordersList[index]
                                                          .colorHexa)),
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(
                                                          MediaQuery.of(context)
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
                                          ordersList[index].colorName.trim() !=
                                                  ''
                                              ? Text(
                                                  'Color Name : ${ordersList[index].colorName}')
                                              : Container(),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .01,
                                          ),
                                          //number of pieces
                                          Text(
                                              'Number Of Pieces : ${ordersList[index].num.toString()}'),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .01,
                                          ),
                                          Text(
                                              'Price : ${ordersList[index].price} \$')
                                        ],
                                      ),
                                    ),
                                    //img and btn co
                                    Container(
                                      color:
                                          myThemeData.coffecolor.withAlpha(50),
                                      child: Column(
                                        children: [
                                          //img
                                          Container(
                                            color: Colors.white,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3,
                                            child: Image.network(
                                              'http:${ordersList[index].imgUrl}',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          //delete
                                          //space between img and btn (white)
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .01,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .2,
                                            color: Colors.white,
                                          ),
                                          ElevatedButton(
                                              style: ButtonStyle(
                                                  elevation:
                                                      MaterialStateProperty.all(
                                                          0),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.white)),
                                              onPressed: () {
                                                shoppingCartProvider
                                                    .deleteFromOrderList(
                                                        ordersList[index].id,
                                                        ordersList[index]
                                                            .colorHexa,
                                                        ordersList[index].num);
                                              },
                                              child:
                                                  //delete text and delete icon
                                                  Row(
                                                children: [
                                                  Text(
                                                    'Delete',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: myThemeData
                                                          .darkRedColor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .05,
                                                  ),
                                                  Icon(
                                                    Icons.delete,
                                                    size: 17,
                                                    color: myThemeData
                                                        .darkRedColor,
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
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
                                                border: Border.all(
                                                    color: myThemeData
                                                        .coffecolor
                                                        .withAlpha(100))),
                                            padding: const EdgeInsets.all(25),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Text(
                                              'Total :  ${shoppingCartProvider.totalPrice} ',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          ElevatedButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        myThemeData.coffecolor),
                                              ),
                                              //check out btn
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  //Check out
                                                  const Text(
                                                    "Check out",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        letterSpacing: 2),
                                                  ),

                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .05,
                                                  ),
                                                  const Icon(
                                                    Icons.check_outlined,
                                                    size: 20,
                                                  )
                                                ],
                                              ))
                                        ],
                                      )
                                    : Container(),
                              ],
                            ),
                          ));
                    })));
  }
}
