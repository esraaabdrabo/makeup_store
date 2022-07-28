import 'package:flutter/cupertino.dart';
import 'package:store/models/product.dart';
import 'package:store/services/brand.dart';

class BrandVM extends ChangeNotifier {
  List<Product> products = [];
  bool isLoading = false;
  String errorMessage = '';

  BrandVM(String brandName) {
    getProducts(brandName);
  }
  changeLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  getProducts(String brandName) async {
    changeLoading(true);
    var res = await BrandSV.getProductsBrand(brandName);
    if (res is Products) {
      products = res.brandsProducts;
    } else {
      errorMessage = res;
    }
    changeLoading(false);
  }
}
