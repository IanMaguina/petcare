// To parse this JSON data, do
//
//     final Region = uservetFromJson(jsonString);

import 'dart:convert';

Productv typerProducttFromJson(String str) => Productv.fromJson(json.decode(str));

String productToJson(Productv data) => json.encode(data.toJson());

class Productv {
  Productv({
    this.id,
    this.name,
    this.PJPId,
    this.TypeProductId,
  });

  int id;
  String name;
  int PJPId;
  int TypeProductId;

  factory Productv.fromJson(Map<String, dynamic> json) {
    return Productv(
      id: json["id"],
      name: json["name"],
      PJPId: json["PJPId"],
      TypeProductId: json["TypeProductId"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "PJPId": PJPId,
      "TypeProductId": TypeProductId,
    };
  }
}
