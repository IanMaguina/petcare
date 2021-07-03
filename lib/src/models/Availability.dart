// To parse this JSON data, do
//
//     final Region = uservetFromJson(jsonString);

import 'dart:convert';

Availability typerProducttFromJson(String str) => Availability.fromJson(json.decode(str));

String productToJson(Availability data) => json.encode(data.toJson());

class Availability {
  Availability ({
    this.id,
    this.name,

  });

  int id;
  String name;



  factory Availability .fromJson(Map<String, dynamic> json) {
    return Availability (
        id: json["id"],
        name: json["name"],

      );
}

  Map<String, dynamic> toJson() {
    return{
        "id": id,
        "name": name,

    };
  }
}
