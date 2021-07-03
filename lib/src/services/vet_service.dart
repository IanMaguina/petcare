import 'dart:convert';
import 'dart:io';
import 'package:petcare/src/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/uservet.dart';
import 'package:petcare/src/models/veterinary.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';
import 'package:petcare/src/services/user_vet_service.dart';

class VetService {
  static const API = 'https://petcarefas.azurewebsites.net/api';
  static const headers = {
    // 'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471',
    'Content-Type': 'application/json'
  };
  UservService uvService = new UservService();
  Uservet uservet = new Uservet();

  Future<APIResponse<bool>> createVet(Veterinary item) {
    return http
        .post(Uri.parse(API + '/business'),
            headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<List<Veterinary>>> getVetsList() {
    return http
        .get(Uri.parse(API + '/providers'), headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <Veterinary>[];
        for (var item in jsonData) {
          notes.add(Veterinary.fromJson(item));
        }
        return APIResponse<List<Veterinary>>(data: notes);
      }
      return APIResponse<List<Veterinary>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<Veterinary>>(
            error: true, errorMessage: 'An error occured'));
  }

  PreferenciasUsuario _prefs = new PreferenciasUsuario();

  Future<APIResponse<Veterinary>> getVet(int uvID) {
    final urlPetcare = _prefs.urlPetcare;
    final token = _prefs.token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEyIiwibmJmIjoxNjI1Mjc2OTIyLCJleHAiOjE2MjU4ODE3MjIsImlhdCI6MTYyNTI3NjkyMn0.u_HdPVpyOM7hT0kx7WAbwWtgTVOHq-Ts2N4j05ls8Og";
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };

    return http
        .get(Uri.parse(urlPetcare + '/providers/' + uvID.toString()),
            headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final vet =
            APIResponse<Veterinary>(data: Veterinary.fromJson(jsonData));
        return vet;
      }
      return APIResponse<Veterinary>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<Veterinary>(
            error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> updateVet(String uvID, Veterinary item) {
    var jsonv = item.toJson();
    print(jsonv);
    return http
        .put(Uri.parse(API + '/business/' + uvID + '/providers/' + uvID),
            headers: headers, body: json.encode(jsonv))
        .then((data) {
      print(data.body.toString());
      if (data.statusCode == 204) {
        print("FUNCIONA   " + item.businessname);
        return APIResponse<bool>(data: true);
      } else {
        print("NO FUNCIONA  " + item.businessname);
      }

      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
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

final urlPetcare = "https://localhost:44353/api";

final token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjkiLCJuYmYiOjE2MjA0NTIxOTgsImV4cCI6MTYyMTA1Njk5OCwiaWF0IjoxNjIwNDUyMTk4fQ.G-jOetqvYbgACErTLsF3iimKNKeHSZooUXX0YH8LXFI';

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
