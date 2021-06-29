// To parse  this JSON data, do
//
//     final typeService = typeServiceFromJson(jsonString);

import 'dart:convert';

List<TypeService> typeServiceFromJson(String str) => List<TypeService>.from(
    json.decode(str).map((x) => TypeService.fromJson(x)));

String typeServiceToJson(List<TypeService> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TypeService {
  TypeService({
     this.id,
     this.name,
  });

  int id;
  String name;

  factory TypeService.fromJson(Map<String, dynamic> json) => TypeService(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

//building autogen

/* import 'package:json_annotation/json_annotation.dart';
part 'service.g.dart';

@JsonSerializable()
class Service {
  final int id;
  final String name;
  Service({ this.id,  this.name});
  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceToJson( this);
}
 */
