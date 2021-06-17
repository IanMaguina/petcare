// To parse this JSON data, do
//
//     final uservet = uservetFromJson(jsonString);

import 'dart:convert';

Uservet uservetFromJson(String str) => Uservet.fromJson(json.decode(str));

String uservetToJson(Uservet data) => json.encode(data.toJson());

class Uservet {
  Uservet({
    this.id,
    this.name,
    this.lastName,
    this.document,
    this.email,
    this.password,
    this.phone,
    this.age,
    this.photo,
    this.owner
  });

  int id;
  String name;
  String lastName;
  int document;
  String email;
  String password;
  int phone;
  int age;
  String photo;
  bool owner;

  factory Uservet.fromJson(Map<String, dynamic> json) {
    return Uservet(
        id: json["id"],
        name: json["name"],
        lastName: json["lastName"],
        document: json["document"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        age: json["age"],
        photo: json["photo"],
        owner: json["owner"],
      );
}

  Map<String, dynamic> toJson() {
    return{
        "id": id,
        "name": name,
        "lastName": lastName,
        "document": document,
        "email": email,
        "password": password,
        "phone": phone,
        "age": age,
        "photo": photo,
        "owner":owner,
    };
  }
}
