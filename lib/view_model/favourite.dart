import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:store/models/product.dart';

class FavouriteVM extends ChangeNotifier {
  List<Product> favList = [];
  addToFav(Product newProd) {
    favList.add(newProd);
    log('add');
    notifyListeners();
  }

  removeFromFav(int id) {
    favList.removeWhere(((element) => element.id == id));
    notifyListeners();
  }
}
