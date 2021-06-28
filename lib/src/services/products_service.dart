import 'dart:convert';
import 'dart:math';
import 'package:petcare/src/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/date.dart';
import 'package:petcare/src/models/product.dart';
import 'package:petcare/src/models/veterinary.dart';

class ProductService {
  static const API = 'https://petcarefas.azurewebsites.net/api';
  static const headers = {
    // 'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471',
    'Content-Type': 'application/json'
  };

  Future<APIResponse<Product>> getProduct(String pid) {
    return http.get(Uri.parse(API + '/products/' + pid), headers: headers).then(
        (data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Product>(data: Product.fromJson(jsonData));
      }
      return APIResponse<Product>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
        APIResponse<Product>(error: true, errorMessage: 'An error occured'));
  }
}
