import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store/models/product.dart';

class MakeUpSV {
  static getProducts(String arg) async {
    String hostUrl = 'http://makeup-api.herokuapp.com/api/v1/products.json?';
    http.Response response = await http.get(Uri.parse('$hostUrl$arg'));
    if (response.statusCode == 200) {
      return Products.fromJson(jsonDecode(response.body));
    } else {
      return 'falid in reaching server';
    }
  }
}
