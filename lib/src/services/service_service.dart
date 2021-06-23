import 'package:flutter/material.dart';
import 'package:petcare/src/models/service_.dart';
import 'package:http/http.dart' as http;

final urlVet = "https://petcaremobileapi.azurewebsites.net/api";
final apiKey = "";
final token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjkiLCJuYmYiOjE2MjA0NzUzMDEsImV4cCI6MTYyMTA4MDEwMSwiaWF0IjoxNjIwNDc1MzAxfQ.5dznWV6mObQWEZfQ104bb_TY49bCvcmxGD4ZWg5QwQE";

class ServicesService with ChangeNotifier {
  List<Service> servicios = [];

  ServicesService() {
    this.getServices();
  }

  getServices() async {
    //endPoint
    //var id = '7';
    final url = '$urlVet/dashboard/products-types';
    final resp = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var data;
    if (resp.body.isNotEmpty) {
      data = serviceFromJson(resp.body);
    }

    this.servicios.addAll(data);
    notifyListeners();
  }
}
