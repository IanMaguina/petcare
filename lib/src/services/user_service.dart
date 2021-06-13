import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:petcare/src/models/user.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';

//production:
//final urlPetcare = "https://petcaremobileapi.azurewebsites.net/api";
//local:
//final urlPetcare = "https://localhost:44353/api";
String get urlPetcare {
  if (Platform.isAndroid) {
    return 'https://10.0.2.2:5001/api';
  } else {
    return 'https://localhost:5001/api';
  }
}

final _prefs = new PreferenciasUsuario();
// token = _prefs.token();

class UserService with ChangeNotifier {
  // final String _firebaseToken = 'AIzaSyAzIGZax6Pn30zGytZkwyXJdEmsKiRDRc8';
  List<User> listadoUsers = [];
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
    final url = Uri.https('$urlPetcare', '/people', {'q': '{http}'});
    Response resp = await post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode(data));
    if (resp.statusCode == 200) {
      Map<String, dynamic> decodedResp = json.decode(resp.body);
      print(decodedResp);

      if (decodedResp.containsKey('id')) {
        //se creo el usuario
        _prefs.iduser = decodedResp['id'];

        return {'ok': true, 'mensaje': 'usuario creado correctamente!'};
      } else {
        return {'ok': false, 'mensaje': 'Error'};
      }
    } else {
      print('Request failed with status: ${resp.statusCode}.');
    }
  }

  Future<void> getAlluser() async {
    //endPoint
    //var id = _prefs.iduser;
    var token = _prefs.token;
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };
    final url = Uri.parse('$urlPetcare/people/');
    Response resp = await get(url, headers: headers);

    var data;
    if (resp.body.isNotEmpty) {
      data = userFromJson(resp.body);
    }

    this.listadoUsers.addAll(data);
    notifyListeners();
  }
}
