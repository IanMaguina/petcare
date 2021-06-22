/*
import 'package:flutter/material.dart';
import 'package:petcare/src/models/uservet.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/preferencias_usuario/prefs.dart';

//production:
//final urlPetcare = "https://petcaremobileapi.azurewebsites.net/api";
//local:
final urlPetcare = "https://localhost:44353/api";
final apiKey = "";

final _prefs = new PreferenciasUsuario();

class VetService2 with ChangeNotifier {
  List<Uservet> vets = [];

  VetService() {
    this.getVetUserById();
  }

  getVetUserById() async {
    //endPoint
    var idVeterinary = '2';
    var token = _prefs.token;
    final url =
        Uri.https('$urlPetcare', '/business/$idVeterinary', {'q': '{http}'});
    final resp = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data;
    if (resp.body.isNotEmpty) {
      data = uservetFromJson(resp.body);
    }

    this.vets.addAll(data);
    notifyListeners();
  }
}
*/