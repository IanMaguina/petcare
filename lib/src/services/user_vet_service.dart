import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/user.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';

//production:
//final urlPetcare = "https://petcaremobileapi.azurewebsites.net/api";
//local:
final urlPetcare = "https://localhost:44353/api";

final _prefs = new PreferenciasUsuario();

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
    final url = Uri.https('$urlPetcare', '/business', {'q': '{http}'});
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

      return {'ok': true, 'mensaje': 'veterinario creado correctamente!'};
    } else {
      return {'ok': false, 'mensaje': 'Error'};
    }
  }
}
