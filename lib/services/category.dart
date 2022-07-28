import 'makeUp.dart';

class CategorySV {
  static getProductsCategory(String categoryName) async {
    String arg = 'product_type=$categoryName';
    return MakeUpSV.getProducts(arg);
  }
}
