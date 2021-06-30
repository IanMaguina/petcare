import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/models/pet.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';

class PetsService {
  List<Pet> listadoPets = [];
  final _prefs = new PreferenciasUsuario();

  Future<APIResponse<List<Pet>>> getPetByCustomerId() {
    final urlPetcare = _prefs.urlPetcare;
    var token = _prefs.token;
    final idCustomer = _prefs.iduser;
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };

    return http
        .get(Uri.parse(urlPetcare + '/people/$idCustomer/pets'),
            headers: headers)
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
          error: true, errorMessage: 'no se encontraron mascotas');
    }).catchError((_) => APIResponse<List<Pet>>(
            error: true, errorMessage: 'An error occured'));
  }

  //Miguel update
  Future<APIResponse<bool>> updatePetByCustomerId(String id, Pet pet) {
    final urlPetcare = _prefs.urlPetcare;
    var token = _prefs.token;
    var iduser = _prefs.iduser;
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };

    var jsonv = pet.toJson();
    print(jsonv);
    return http
        .put(Uri.parse(urlPetcare + "/people/$iduser/pets/$id"),
            headers: headers, body: json.encode(jsonv))
        .then((data) {
      print(data.body.toString());
      if (data.statusCode == 201) {
        print("FUNCIONA   ");
        return APIResponse<bool>(data: true);
      } else {
        print("NO FUNCIONA   ");
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }
}
