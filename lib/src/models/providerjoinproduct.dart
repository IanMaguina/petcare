// To parse this JSON data, do
//
//     final Providerjoinproduct = uservetFromJson(jsonString);

import 'dart:convert';

Providerjoinproduct providerjoinproductFromJson(String str) => Providerjoinproduct.fromJson(json.decode(str));

String providerjoinproductToJson(Providerjoinproduct data) => json.encode(data.toJson());

class Providerjoinproduct {
  Providerjoinproduct(
      { this.id,
         this.name,
      });

  int id;
  String name;


  factory Providerjoinproduct.fromJson(Map<String, dynamic> json) {
    return Providerjoinproduct(
      id: json["id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,

    };
  }
}
