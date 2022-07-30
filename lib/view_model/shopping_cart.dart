import 'package:flutter/cupertino.dart';

class ShoppingCartVM extends ChangeNotifier {
  int itemsNum = 0;

  addItem() {
    itemsNum++;
    notifyListeners();
  }
}
