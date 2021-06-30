import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/models/pet.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';

class PetsService {
  List<Pet> listadoPets = [];
  final _prefs = new PreferenciasUsuario();

  PetsService() {
    this.getPetByCustomerId();
  }

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
}
