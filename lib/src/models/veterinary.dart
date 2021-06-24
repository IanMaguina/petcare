// To parse this JSON data, do
//
//     final veterinary = veterinaryFromJson(jsonString);

import 'dart:convert';

List<Veterinary> veterinaryFromJson(String str) =>
    List<Veterinary>.from(json.decode(str).map((x) => Veterinary.fromJson(x)));

String veterinaryToJson(List<Veterinary> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Veterinary vetFromJson(String str) => Veterinary.fromJson(json.decode(str));

String vetToJson(Veterinary data) => json.encode(data.toJson());

class Veterinary {
  Veterinary({
    this.id,
    this.businessname,
    this.region,
    this.field,
    this.address,
    this.email,
    this.description,
  });

  int id;
  String businessname;
  String region;
  String field;
  String address;
  String email;
  String description;

  factory Veterinary.fromJson(Map<String, dynamic> json) {
    return Veterinary(
      id: json["id"],
      businessname: json["businessName"],
      region: json["region"],
      field: json["field"],
      address: json["address"],
      email: json["email"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "businessName": businessname,
      "region": region,
      "field": field,
      "address": address,
      "email": email,
      "description": description,
    };
  }
}
