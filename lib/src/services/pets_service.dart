import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/pet.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';

//production:
//final urlPetcare = "https://petcaremobileapi.azurewebsites.net/api";
//local:
final urlPetcare = "https://localhost:44353/api";
final apiKey = "";

final _prefs = new PreferenciasUsuario();

class PetsService with ChangeNotifier {
  List<Pet> listadoPets = [];

  PetsService() {
    this.getPetByCustomerId();
  }

  getPetByCustomerId() async {
    //endPoint
    var id = _prefs.iduser;
    var token = _prefs.token;

    final url = Uri.https('$urlPetcare', '/people/$id/pets', {'q': '{http}'});
    final resp = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data;
    if (resp.body.isNotEmpty) {
      data = petsFromJson(resp.body);
    }

    this.listadoPets.addAll(data);
    notifyListeners();
  }
}
