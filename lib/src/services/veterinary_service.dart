import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/veterinary.dart';

final urlPetcare = "https://petcaremobileapi.azurewebsites.net/api";
final apiKey = "";
final token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjkiLCJuYmYiOjE2MjA0NzUzMDEsImV4cCI6MTYyMTA4MDEwMSwiaWF0IjoxNjIwNDc1MzAxfQ.5dznWV6mObQWEZfQ104bb_TY49bCvcmxGD4ZWg5QwQE';

class VeterinaryService with ChangeNotifier {
  List<Veterinary> veterinarias = [];

  VeterinaryService() {
    this.getAllVeterinaries();
  }

  getAllVeterinaries() async {
    //endPoint
    //var id = '7';
    final url = '$urlPetcare/providers';
    final resp = await http.get(Uri.parse(url), headers: {
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
