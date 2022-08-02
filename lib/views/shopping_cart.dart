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
            ? const SizedBox(
                child: Text('shopping cart is empty'),
              )
            : ListView.builder(
                itemCount: ordersList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.network('http:${ordersList[index].imgUrl}'),
                      Text(ordersList[index].id.toString()),
                    ],
                  );
                }));
  }
}
