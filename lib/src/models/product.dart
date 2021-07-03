//
//     final Product = DateFromJson(jsonString);

import 'dart:convert';

import 'dart:ffi';

import 'package:petcare/src/models/date.dart';

//Product DateFromJson(String str) => Product.fromJson(json.decode(str));
Product DateFromJson(String str) => Product.fromJson(json.decode(str));

String DateToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.id,
    this.type_service,
    this.name,
    this.price,
    this.service_avaiability,
  });

  int id;
  int type_service;
  String name;
  Double price;
  Date service_avaiability;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        type_service: json["type_service"],
        name: json["name"],
        price: json["price"],
        service_avaiability: json["service_avaiability"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type_service": type_service,
        "name": name,
        "price": price,
        "service_avaiability": service_avaiability,
      };
}
