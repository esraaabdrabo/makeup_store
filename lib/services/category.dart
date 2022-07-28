import 'makeUp.dart';

class CategorySV {
  static getProductsCategory(String categoryName) async {
    String arg = 'product_type=$categoryName';
    print(arg);
    return MakeUpSV.getProducts(arg);
  }
}
