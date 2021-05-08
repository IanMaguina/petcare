import 'dart:convert';

Pets petsFromJson(String str) => Pets.fromJson(json.decode(str));

String petsToJson(Pets data) => json.encode(data.toJson());

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
