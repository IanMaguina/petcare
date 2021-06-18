
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

//User userFromJson(String str) => User.fromJson(json.decode(str));
User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.name,
    this.lastName,
    this.document,
    this.email,
    this.password,
    this.phone,
    this.age,
    this.photo,
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

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastName: json["lastName"],
        document: json["document"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        age: json["age"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastName": lastName,
        "document": document,
        "email": email,
        "password": password,
        "phone": phone,
        "age": age,
        "photo": photo,
      };
 }
