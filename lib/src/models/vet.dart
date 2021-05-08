// To parse this JSON data, do
//
//     final veterinary = veterinaryFromJson(jsonString);

import 'dart:convert';

Veterinary veterinaryFromJson(String str) =>
    Veterinary.fromJson(json.decode(str));

String veterinaryToJson(Veterinary data) => json.encode(data.toJson());

class Veterinary {
  Veterinary({
    this.id,
    this.businessName,
    this.region,
    this.field,
    this.address,
    this.email,
    this.description,
  });

  int id;
  String businessName;
  String region;
  String field;
  String address;
  String email;
  String description;

  factory Veterinary.fromJson(Map<String, dynamic> json) => Veterinary(
        id: json["id"],
        businessName: json["businessName"],
        region: json["region"],
        field: json["field"],
        address: json["address"],
        email: json["email"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "businessName": businessName,
        "region": region,
        "field": field,
        "address": address,
        "email": email,
        "description": description,
      };
}
