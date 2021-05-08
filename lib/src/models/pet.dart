// To parse this JSON data, do
//
//     final pets = petsFromJson(jsonString);

import 'dart:convert';

List<Pets> petsFromJson(String str) =>
    List<Pets>.from(json.decode(str).map((x) => Pets.fromJson(x)));

String petsToJson(List<Pets> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pets {
  Pets({
    this.id,
    this.name,
    this.age,
    this.breed,
    this.photo,
    this.sex,
  });

  int id;
  String name;
  String age;
  String breed;
  String photo;
  String sex;

  factory Pets.fromJson(Map<String, dynamic> json) => Pets(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        breed: json["breed"],
        photo: json["photo"],
        sex: json["sex"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "breed": breed,
        "photo": photo,
        "sex": sex,
      };
}
