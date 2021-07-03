import 'dart:convert';

import 'package:petcare/src/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/login_response.dart';
import 'package:petcare/src/models/uservet.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';

class UservService {
  // static const API = 'https://petcarefas.azurewebsites.net/api';
  static const headers = {
    // 'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471',
    'Content-Type': 'application/json'
  };
  final _prefs = new PreferenciasUsuario();

  Future<APIResponse<bool>> createUserv(Uservet item) {
    final urlPetcare = _prefs.urlPetcare;
    return http
        .post(Uri.parse(urlPetcare + '/business'),
            headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<List<Uservet>>> getUservetsList() {
    final urlPetcare = _prefs.urlPetcare;
    return http
        .get(Uri.parse(urlPetcare + '/business'), headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <Uservet>[];
        for (var item in jsonData) {
          notes.add(Uservet.fromJson(item));
        }
        return APIResponse<List<Uservet>>(data: notes);
      }
      return APIResponse<List<Uservet>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<Uservet>>(
            error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<Uservet>> getUservet(String uvID) {
    final urlPetcare = _prefs.urlPetcare;
    return http
        .get(Uri.parse(urlPetcare + '/business/' + uvID), headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Uservet>(data: Uservet.fromJson(jsonData));
      }
      return APIResponse<Uservet>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<Uservet>(
            error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> updateUservet(String uvID, Uservet item) {
    final urlPetcare = _prefs.urlPetcare;
    var jsonv = item.toJson();
    print(jsonv);
    return http
        .put(Uri.parse(urlPetcare + '/business/' + uvID),
            headers: headers, body: json.encode(jsonv))
        .then((data) {
      print(data.body.toString());
      if (data.statusCode == 204) {
        print("FUNCIONA   ");
        return APIResponse<bool>(data: true);
      }
      print("NO FUNCIONA  ");
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<LoginResponse>> loginvet(String uID, String uPwd) {
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
        if (jsonData['rolId'] != 2) {
          return APIResponse<LoginResponse>(
              error: true, errorMessage: 'No existe el veterinario');
        }
        _prefs.token = jsonData['token'];
        _prefs.idvet = jsonData['idf'];

        return APIResponse<LoginResponse>(
            data: LoginResponse.fromJson(jsonData));
      }
      return APIResponse<LoginResponse>(
          error: true, errorMessage: 'El usuario y/o Contraseña es incorrecto');
    }).catchError((_) => APIResponse<LoginResponse>(
            error: true, errorMessage: 'An error occured'));
  }
}
/*
  Future<APIResponse<List<NoteForListing>>> getNotesList() {
    return http.get(API + '/notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          notes.add(NoteForListing.fromJson(item));
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }
      return APIResponse<List<NoteForListing>>(error: true, errorMessage: 'An error occured');
    })
        .catchError((_) => APIResponse<List<NoteForListing>>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<Note>> getNote(String noteID) {
    return http.get(API + '/notes/' + noteID, headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Note>(data: Note.fromJson(jsonData));
      }
      return APIResponse<Note>(error: true, errorMessage: 'An error occured');
    })
        .catchError((_) => APIResponse<Note>(error: true, errorMessage: 'An error occured'));
  }
*/

/*

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/uservet.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> development
final urlPetcare = "https://localhost:44353/api";

final token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjkiLCJuYmYiOjE2MjA0NTIxOTgsImV4cCI6MTYyMTA1Njk5OCwiaWF0IjoxNjIwNDUyMTk4fQ.G-jOetqvYbgACErTLsF3iimKNKeHSZooUXX0YH8LXFI';
<<<<<<< HEAD
=======
//production:
//final urlPetcare = "https://petcaremobileapi.azurewebsites.net/api";
//local:
final urlPetcare = "https://localhost:44353/api";

final _prefs = new PreferenciasUsuario();
>>>>>>> test_william
=======
>>>>>>> development

class UserService with ChangeNotifier {
  // final String _firebaseToken = 'AIzaSyAzIGZax6Pn30zGytZkwyXJdEmsKiRDRc8';

  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> nuevoUsuarioVet(Uservet user) async {
    final data = {
      "name": user.name,
      "lastname": user.lastName,
      "document": user.document,
      "email": user.email,
      "password": user.password,
      "photo": '',
      "phone": user.phone,
      "age": user.age,
      // 'token' : true
    };
    final url = '$urlPetcare/business';
    final resp = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode(data));

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);

    if (decodedResp.containsKey('id')) {
      //se creo el usuario
      _prefs.iduser = decodedResp['id'];

      return {'ok': true, 'mensaje': 'usuario creado correctamente!'};
    } else {
      return {'ok': false, 'mensaje': 'Error'};
    }
  }
}
*/
