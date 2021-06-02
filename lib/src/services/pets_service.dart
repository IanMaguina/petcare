import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/pet.dart';

final urlPetcare = "https://petcaremobileapi.azurewebsites.net/api";
final apiKey = "";
final token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjkiLCJuYmYiOjE2MjA0NTIxOTgsImV4cCI6MTYyMTA1Njk5OCwiaWF0IjoxNjIwNDUyMTk4fQ.G-jOetqvYbgACErTLsF3iimKNKeHSZooUXX0YH8LXFI";

class PetsService with ChangeNotifier {
  List<Pets> listadoPets = [];

  PetsService() {
    this.getPetByCustomerId();
  }

  getPetByCustomerId() async {
    //endPoint
    var id = '7';
    final url = '$urlPetcare/people/$id/pets';
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
