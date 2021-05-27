import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/user.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';

final urlPetcare = "https://petcaremobileapi.azurewebsites.net/api";

final token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjkiLCJuYmYiOjE2MjA0NTIxOTgsImV4cCI6MTYyMTA1Njk5OCwiaWF0IjoxNjIwNDUyMTk4fQ.G-jOetqvYbgACErTLsF3iimKNKeHSZooUXX0YH8LXFI';

class UserService with ChangeNotifier {
  // final String _firebaseToken = 'AIzaSyAzIGZax6Pn30zGytZkwyXJdEmsKiRDRc8';

  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> nuevoUsuario(User user) async {
    final data = {
      "name": user.name,
      "lastname": user.lastName,
      "document": user.document,
      "email": user.email,
      "password": user.password,
      "photo": '',
      "phone": user.phone,
      "age": user.age,
      // 'token' : true
    };
    final url = '$urlPetcare/people';
    final resp = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode(data));

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);

    if (decodedResp.containsKey('id')) {
      //se creo el usuario
      _prefs.iduser = decodedResp['id'];

      return {'ok': true, 'mensaje': 'usuario creado correctamente!'};
    } else {
      return {'ok': false, 'mensaje': 'Error'};
    }
  }
}
