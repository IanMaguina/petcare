// To parse this JSON data, do
//
//     final headerPetProfile = headerPetProfileFromJson(jsonString);

import 'dart:convert';

HeaderPetProfile headerPetProfileFromJson(String str) =>
    HeaderPetProfile.fromJson(json.decode(str));

String headerPetProfileToJson(HeaderPetProfile data) =>
    json.encode(data.toJson());

class HeaderPetProfile {
  HeaderPetProfile({
    this.id,
    this.name,
    this.weight,
    this.height,
    this.lenght,
    this.eyes,
    this.breed,
    this.sex,
    this.color,
    this.description,
    this.photo,
    this.age,
  });

  int id;
  String name;
  String weight;
  String height;
  String lenght;
  String eyes;
  String breed;
  String sex;
  String color;
  String description;
  String photo;
  String age;

  factory HeaderPetProfile.fromJson(Map<String, dynamic> json) =>
      HeaderPetProfile(
        id: json["id"],
        name: json["name"],
        weight: json["weight"],
        height: json["height"],
        lenght: json["lenght"],
        eyes: json["eyes"],
        breed: json["breed"],
        sex: json["sex"],
        color: json["color"],
        description: json["description"],
        photo: json["photo"],
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "weight": weight,
        "height": height,
        "lenght": lenght,
        "eyes": eyes,
        "breed": breed,
        "sex": sex,
        "color": color,
        "description": description,
        "photo": photo,
        "age": age,
      };
}
