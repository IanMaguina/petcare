// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.id,
    this.username,
    this.token,
  });

  int id;
  String username;
  String token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        id: json["id"],
        username: json["username"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "token": token,
      };
}
