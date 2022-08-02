import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/view_model/shopping_cart.dart';
import 'package:store/widgets/commonWidgets.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShoppingCartVM shoppingCartProvider = Provider.of(context);
    List<Order> ordersList = shoppingCartProvider.ordersList;
    return Scaffold(
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
                          onTap: () async {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
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
                                                        .05),
                                              ),
                                            ],
                                          ),
                                          //selected  color name
                                          ordersList[index].colorName.trim() !=
                                                  ''
                                              ? Text(
                                                  'Color Name : ${ordersList[index].colorName}')
                                              : Container(),
                                          //number of pieces
                                          Text(
                                              'Number Of Pieces : ${ordersList[index].num.toString()}'),
                                          Text(
                                              'Price : ${ordersList[index].price}')
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .3,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                .3,
                                        child: Image.network(
                                            'http:${ordersList[index].imgUrl}')),
                                  ],
                                ),
                                index == ordersList.length - 1
                                    ? Text(
                                        'Total ${shoppingCartProvider.totalPrice} ')
                                    : Container(),
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color(0xFFFFFFFF))),
                                    onPressed: () {
                                      shoppingCartProvider.deleteFromOrderList(
                                          ordersList[index].id,
                                          ordersList[index].colorHexa,
                                          ordersList[index].num);
                                    },
                                    child: const Text(
                                      'Remove From Cart',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color.fromARGB(117, 0, 0, 0),
                                          fontWeight: FontWeight.w400),
                                    ))
                              ],
                            ),
                          ));
                    })));
  }
}
