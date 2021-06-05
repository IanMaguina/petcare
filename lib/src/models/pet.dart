// To parse this JSON data, do
//
//     final pets = petsFromJson(jsonString);

import 'dart:convert';

List<Pet> petsFromJson(String str) =>
    List<Pet>.from(json.decode(str).map((x) => Pet.fromJson(x)));

String petsToJson(List<Pet> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pet {
  Pet({
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

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
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
