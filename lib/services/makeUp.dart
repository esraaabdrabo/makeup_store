import 'package:http/http.dart' as http;

class MakeUpSV {
  static getProducts(String arg) async {
    String hostUrl = 'http://makeup-api.herokuapp.com/api/v1/products.json?';
    http.Response response = await http.get(Uri.parse('$hostUrl$arg'));
    if (response.statusCode == 200) {
      return response;
    } else {
      return 'falid in reaching server';
    }
  }
}
