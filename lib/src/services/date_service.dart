import 'dart:convert';
import 'dart:math';
import 'package:petcare/src/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/date.dart';
import 'package:petcare/src/models/pet.dart';
import 'package:petcare/src/models/product.dart';
import 'package:petcare/src/pages/veterinary_detail_page.dart';
import 'package:petcare/src/providers/usuario_provider.dart';
import 'package:petcare/src/models/veterinary.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';

class DateService {
  static const API = 'https://petcarefas.azurewebsites.net/api';
  static const headers = {
    // 'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471',
    'Content-Type': 'application/json'
  };
  final _prefs = new PreferenciasUsuario();

  //Miguel date
  Future<APIResponse<bool>> createDate(Date date) {
    Pet pet;
    Veterinary vet;
    Product prod;
    final urlPetcare = _prefs.urlPetcare;
    var token = _prefs.token;
    final idUser = _prefs.iduser;
    final idVet = _prefs.idvet.toString(); //id veterinario
    final idVetDP = vet.id.toString(); //id veterinaria
    final idPet = pet.id.toString();
    final idProd = prod.id.toString();
    
    var jsonv=date.toJson();
    return http
        .post(Uri.parse(urlPetcare + '/people/$idUser/pets/$idPet/providers/$idVetDP/products/$idProd/requests'),
            headers: headers, body: json.encode(jsonv))
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }


  Future<APIResponse<List<Date>>> getdateList(String id) {
    return http
        .get(Uri.parse(API + '/people/' + id + 'requests'), headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <Date>[];
        for (var item in jsonData) {
          notes.add(Date.fromJson(item));
        }
        return APIResponse<List<Date>>(data: notes);
      }
      return APIResponse<List<Date>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<Date>>(
            error: true, errorMessage: 'An error occured'));
  }
  
}
