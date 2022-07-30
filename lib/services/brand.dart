import 'makeUp.dart';

class BrandSV {
  static getProductsBrand(String brandName) async {
    String arg = 'brand=$brandName';
    return MakeUpSV.getProducts(arg);
  }
}
