import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/veterinary.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';

//production:
//final urlPetcare = "https://petcaremobileapi.azurewebsites.net/api";
//local:
final urlPetcare = "https://localhost:44353/api";
final apiKey = "";
final _prefs = new PreferenciasUsuario();

class VeterinaryService with ChangeNotifier {
  List<Veterinary> veterinarias = [];

  VeterinaryService() {
    this.getAllVeterinaries();
  }

  getAllVeterinaries() async {
    //endPoint
    //var id = '7';
    var token = _prefs.token;

    final url = Uri.https('$urlPetcare', '/providers', {'q': '{http}'});

    final resp = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data;
    if (resp.body.isNotEmpty) {
      data = veterinaryFromJson(resp.body);
    }

    this.veterinarias.addAll(data);
    notifyListeners();
  }
}
