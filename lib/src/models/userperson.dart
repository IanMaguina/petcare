// To parse this JSON data, do
//
//     final UserPersona = UserPersonaFromJson(jsonString);

import 'dart:convert';

//UserPersona UserPersonaFromJson(String str) => UserPersona.fromJson(json.decode(str));
UserPersona userPersonaFromJson(String str) =>
    UserPersona.fromJson(json.decode(str));

String userPersonaToJson(UserPersona data) => json.encode(data.toJson());

class UserPersona {
  UserPersona({
    this.idUsuario,
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
  int idUsuario;
  int id;
  String name;
  String lastName;
  int document;
  String email;
  String password;
  int phone;
  int age;
  String photo;

  factory UserPersona.fromJson(Map<String, dynamic> json) => UserPersona(
        idUsuario: json["idUsuario"],
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
        "idUsuario": idUsuario,
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
