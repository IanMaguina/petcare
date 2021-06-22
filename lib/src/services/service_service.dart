import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petcare/src/models/type_service.dart';
import 'package:http/http.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';

//production:
//final urlPetcare = "https://petcaremobileapi.azurewebsites.net/api";
//local:
//final urlPetcare = 'https://10.0.2.2:44353/api';

//localhost
String get urlPetcare {
  if (Platform.isAndroid) {
    return 'https://10.0.2.2:5001/api';
  } else {
    return 'https://localhost:5001/api';
  }
}

//final apiKey = "";
final _prefs = new PreferenciasUsuario();

class ServicesService with ChangeNotifier {
  List<TypeService> servicios = [];

  ServicesService() {
    this.getServices();
  }

  Future<void> getServices() async {
    //endPoint
    //var id = '7';
    var token = _prefs.token;

    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };

    final url = Uri.parse('$urlPetcare/dashboard/products-types');

    Response resp = await get(url, headers: headers);

    var data;

    if (resp.statusCode == 200) {
      if (resp.body.isNotEmpty) {
        data = typeServiceFromJson(resp.body);
        this.servicios.addAll(data);
        notifyListeners();
      }
    }
  }
}
