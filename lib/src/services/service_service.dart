import 'package:flutter/material.dart';
import 'package:petcare/src/models/service.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/preferencias_usuario/prefs.dart';
import 'dart:convert';

//production:
//final urlPetcare = "https://petcaremobileapi.azurewebsites.net/api";
//local:
final urlPetcare = "https://localhost:44353/api";
final apiKey = "";
final _prefs = new PreferenciasUsuario();

class ServicesService with ChangeNotifier {
  List<Service> servicios = [];

  ServicesService() {
    this.getServices();
  }

  getServices() async {
    //endPoint
    //var id = '7';
    var token = _prefs.token;
    final url =
        Uri.https('$urlPetcare', '/dashboard/products-types', {'q': '{http}'});
    final resp = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var data;

    if (resp.statusCode == 200) {
      if (resp.body.isNotEmpty) {
        data = serviceFromJson(resp.body);
        notifyListeners();
        this.servicios.addAll(data);
      }
    }
  }

  Future<String> makeResquest() async {
    var token = _prefs.token;
    var response = await http
        .get(Uri.parse('$urlPetcare/dashboard/products-types'), headers: {
      'Accept': 'Application/json',
      'Authorization': 'Bearer $token'
    });

    var extractdata = json.decode(response.body);
  }
}
