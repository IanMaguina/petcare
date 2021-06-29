// To parse this JSON data, do
//
//     final Region = uservetFromJson(jsonString);
/*
import 'dart:convert';

Region uservetFromJson(String str) => Region.fromJson(json.decode(str));

String uservetToJson(Region data) => json.encode(data.toJson());

class Region {
  Region({
    this.id,
    this.region,

  });

  int id;
  String region;


  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
        id: json["id"],
        region: json["region"],

      );
}

  Map<String, dynamic> toJson() {
    return{
        "id": id,
        "region": region,

    };
  }
}
*/