// To parse this JSON data, do
//
//

import 'dart:convert';

ServicesModel servicesModelFromJson(String str) =>
    ServicesModel.fromJson(json.decode(str));

String servicesModelToJson(ServicesModel data) => json.encode(data.toJson());

class ServicesModel {
  ServicesModel({this.services});

  List<Service> services;

  factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
        services: List<Service>.from(
            json['services'].map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
      };
}

class Service {
  Service({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
