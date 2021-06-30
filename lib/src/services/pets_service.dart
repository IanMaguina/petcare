import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/models/pet.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';

final apiKey = "";
final token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjkiLCJuYmYiOjE2MjA0NTIxOTgsImV4cCI6MTYyMTA1Njk5OCwiaWF0IjoxNjIwNDUyMTk4fQ.G-jOetqvYbgACErTLsF3iimKNKeHSZooUXX0YH8LXFI";

class PetsService {
  static const API = 'https://petcarefas.azurewebsites.net/api';
  static const headers = {
    // 'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471',
    'Content-Type': 'application/json'
  };
  final _prefs = new PreferenciasUsuario();

  Future<APIResponse<List<Pet>>> getPetByCustomerId(String id) {
    return http
        .get(Uri.parse(API + '/people/' + id + '/pets'), headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <Pet>[];
        for (var item in jsonData) {
          notes.add(Pet.fromJson(item));
        }
        return APIResponse<List<Pet>>(data: notes);
      }
      return APIResponse<List<Pet>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<Pet>>(
            error: true, errorMessage: 'An error occured'));
  }

  //Miguel update
  Future<APIResponse<bool>> updatePetByCustomerId(String id, Pet pet) {
    final urlPetcare = _prefs.urlPetcare;
    var jsonv = pet.toJson();
    print(jsonv);
    return http
        .put(Uri.parse(urlPetcare +'/people/' + '/pets' + id),
            headers: headers, body: json.encode(jsonv))
        .then((data) {
          print(data.body.toString());
      if (data.statusCode == 204) {
        print("FUNCIONA   ");
        return APIResponse<bool>(data: true);
      }
      else{
        print("NO FUNCIONA   ");
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }
}
