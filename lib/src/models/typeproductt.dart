// To parse this JSON data, do
//
//     final Region = uservetFromJson(jsonString);

import 'dart:convert';

TyperProductt typerProducttFromJson(String str) => TyperProductt.fromJson(json.decode(str));

String typerProducttToJson(TyperProductt data) => json.encode(data.toJson());

class TyperProductt {
  TyperProductt ({
    this.id,
    this.name,

  });

  int id;
  String name;


  factory TyperProductt .fromJson(Map<String, dynamic> json) {
    return TyperProductt (
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
