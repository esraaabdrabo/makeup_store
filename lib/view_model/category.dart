import 'package:flutter/cupertino.dart';
import 'package:store/models/product.dart';
import 'package:store/services/brand.dart';
import 'package:store/services/category.dart';

class CategoryVM extends ChangeNotifier {
  List<Product> products = [];
  bool isLoading = false;
  String errorMessage = '';

  CategoryVM(String categoryName) {
    getProducts(categoryName);
  }
  changeLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  getProducts(String categoryName) async {
    changeLoading(true);
    var res = await CategorySV.getProductsCategory(categoryName);
    if (res is Products) {
      products = res.brandsProducts;
    } else {
      errorMessage = res;
    }
    changeLoading(false);
  }
}
