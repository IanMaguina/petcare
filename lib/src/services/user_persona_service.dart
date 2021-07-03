import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/models/login_response.dart';
import 'package:petcare/src/models/user.dart';
import 'package:petcare/src/models/userperson.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';

class UserPersonaService with ChangeNotifier {
  // final String _firebaseToken = 'AIzaSyAzIGZax6Pn30zGytZkwyXJdEmsKiRDRc8';
  // static const API = 'https://petcarefas.azurewebsites.net/api';
  static const headers = {
    // 'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471',
    'Content-Type': 'application/json'
  };

  final _prefs = new PreferenciasUsuario();
  Future<APIResponse<bool>> nuevoUsuario(User item) {
    final urlPetcare = _prefs.urlPetcare;
    return http
        .post(Uri.parse(urlPetcare + '/people'),
            headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> updateUserper(String upID, item) {
    final urlPetcare = _prefs.urlPetcare;
    final token = _prefs.token;
    var jsonv = item.toJson();
    print(jsonv);
    return http
        .put(Uri.parse(urlPetcare + '/people/' + upID),
            headers: headers, body: json.encode(jsonv))
        .then((data) {
      print(data.body.toString());
      if (data.statusCode == 204) {
        print("FUNCIONA   ");
        return APIResponse<bool>(data: true);
      } else {
        print("NO FUNCIONA  ");
      }

      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<UserPersona>> getUser() {
    final urlPetcare = _prefs.urlPetcare;
    final userId  = _prefs.iduser;
    final token = _prefs.token;
    return http
        .get(Uri.parse(urlPetcare + '/people/' + userId.toString()),
            headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<UserPersona>(data: UserPersona.fromJson(jsonData));
      }
      return APIResponse<UserPersona>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<UserPersona>(
            error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<LoginResponse>> login(String uID, String uPwd) {
    final urlPetcare = _prefs.urlPetcare;
    final authData = {
      'username': uID,
      'password': uPwd,
    };
    return http
        .post(Uri.parse(urlPetcare + '/users/authenticate'),
            headers: headers, body: json.encode(authData))
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        if (jsonData['rolId'] != 1) {
          return APIResponse<LoginResponse>(
              error: true, errorMessage: 'No existe el usuario');
        }
        _prefs.token = jsonData['token'];
        _prefs.iduser = jsonData['idf'];

        return APIResponse<LoginResponse>(
            data: LoginResponse.fromJson(jsonData));
      }
      return APIResponse<LoginResponse>(
          error: true, errorMessage: 'El usuario y/o Contraseña es incorrecto');
    }).catchError((_) => APIResponse<LoginResponse>(
            error: true, errorMessage: 'An error occured'));
  }
}
