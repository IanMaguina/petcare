import 'package:flutter/material.dart';
import 'package:petcare/src/models/uservet.dart';
import 'package:http/http.dart' as http;

final urlVet = "https://petcaremobileapi.azurewebsites.net/api";
final apiKey = "";
final token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjkiLCJuYmYiOjE2MjA0NTIxOTgsImV4cCI6MTYyMTA1Njk5OCwiaWF0IjoxNjIwNDUyMTk4fQ.G-jOetqvYbgACErTLsF3iimKNKeHSZooUXX0YH8LXFI";

class VetService2 with ChangeNotifier {
  List<Uservet> vets = [];

  VetService() {
    this.getVetUserById();
  }

  getVetUserById() async {
    //endPoint
    var idVeterinary = '2';
    final url = '$urlVet/business/$idVeterinary';
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
