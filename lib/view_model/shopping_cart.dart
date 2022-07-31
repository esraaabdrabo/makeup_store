import 'package:flutter/cupertino.dart';

class ShoppingCartVM extends ChangeNotifier {
  int itemsNum = 0;
  List<Order> ordersList = [];

  addItem(int id) {
    int foundAtIndex = isInCart(id);
    // foundAtIndex >=0 if element found
    if (isInCart(id) >= 0) {
      ordersList[foundAtIndex].num++;

      notifyListeners();
    } else {
      ordersList.add(Order(id));
      notifyListeners();
    }
  }

//search for certain id in order list
//return -1 if element not foune
// return index if element found
  int isInCart(int id) {
    return ordersList.indexWhere((element) => element.id == id);
  }

//to retuen num on cart for view
  int getproductOrderNum(int id) {
    int foundAtIndex = isInCart(id);
    if (foundAtIndex >= 0) {
      return ordersList[foundAtIndex].num;
    }
    return 0;
  }
}

class Order {
  int id;
  int num = 1;
  Order(this.id);
}
