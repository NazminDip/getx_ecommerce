import 'package:app_ecommerce/model/items_model.dart';

import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();
  static Future<List<Product>?> fetchProducts() async {
    var res = await client.get(Uri.parse("https://fakestoreapi.com/products"));
    if (res.statusCode == 200) {
      var json = res.body;
      return ProductFromJson(json);
    } else {
      print('Error ${res.body}');
    }
    return null;
  }
}
