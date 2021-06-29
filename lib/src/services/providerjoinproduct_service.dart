
import 'dart:convert';

import 'package:petcare/src/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/providerjoinproduct.dart';
import 'package:petcare/src/models/typeproductemun.dart';
import 'package:petcare/src/models/typeproductt.dart';
import 'package:petcare/src/models/uservet.dart';


class PJPService {
  //static const API = 'https://petcarefas.azurewebsites.net/api';
  static const API = 'https://localhost:44353/api';
  static const headers = {
    // 'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471',
    'Content-Type': 'application/json'
  };

  Future<APIResponse<bool>> createPJP(String uvID1,String uvID,String token) {
    final tp=new TyperProductt();
    tp.id=0;
    tp.name="k";
    return http
        .post(Uri.parse(API + '/business/'+uvID+'/providers/'+uvID+'/typeproducts/'+uvID1),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },body: json.encode(tp.toJson()))
        .then((data) {
      if (data.statusCode == 201) {
        print("CONECTA");
        return APIResponse<bool>(data: true);
      }
      print("NO CONECTA");
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<List<Providerjoinproduct >>> getPJPsList() {
    return http
        .get(Uri.parse(API + '/business'), headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <Providerjoinproduct >[];
        for (var item in jsonData) {
          notes.add(Providerjoinproduct .fromJson(item));
        }
        return APIResponse<List<Providerjoinproduct >>(data: notes);
      }
      return APIResponse<List<Providerjoinproduct >>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<Providerjoinproduct >>(
            error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<Providerjoinproduct >> getPJPvet(int uvID) {
    return http
        .get(Uri.parse(API + '/business/' + uvID.toString()), headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Providerjoinproduct >(data: Providerjoinproduct .fromJson(jsonData));
      }
      return APIResponse<Providerjoinproduct >(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<Providerjoinproduct >(
            error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> updatePJP(String uvID, Providerjoinproduct  item) {
    var jsonv = item.toJson();
    print(jsonv);
    return http
        .put(Uri.parse(API + '/business/' + uvID),
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
import 'package:petcare/src/models/Providerjoinproduct .dart';
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

  Future<Map<String, dynamic>> nuevoUsuarioVet(Providerjoinproduct  user) async {
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
