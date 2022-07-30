import 'package:flutter/cupertino.dart';
import 'package:store/models/product.dart';

class FavouriteVM extends ChangeNotifier {
  List<Product> favList = [];
  addToFav(Product newProd) {
    favList.add(newProd);
    notifyListeners();
  }
}
