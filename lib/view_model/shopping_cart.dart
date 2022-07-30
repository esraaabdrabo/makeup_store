import 'package:flutter/cupertino.dart';

class ShoppingCartVM extends ChangeNotifier {
  int itemsNum = 0;
  List<Order> ordersList = [];

  addItem(int id) {
    itemsNum++;
    if (ordersList.isEmpty) {
      ordersList.add(Order(id));
      notifyListeners();
    } else {
      for (var element in ordersList) {
        if (element.id == id) {
          print('in shopping');
          element.num++;
          notifyListeners();
        } else {
          ordersList.add(Order(id));
          notifyListeners();
        }
      }
    }
  }
}

class Order {
  int id = 0;
  int num = 1;
  Order(this.id);

  increaseNum() {
    num++;
  }
}
