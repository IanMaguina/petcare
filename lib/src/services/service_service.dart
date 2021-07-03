import 'dart:convert';
import 'dart:io';

import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/models/service_.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/preferencias_usuario/prefs.dart';

class ServicesService {
  List<Service> servicios = [];
  final _prefs = new PreferenciasUsuario();

  ServicesService() {
    this.getServices();
  }

  Future<APIResponse<List<Service>>> getServices() {
    final urlPetcare = _prefs.urlPetcare;
    var token = _prefs.token;
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };

    return http
        .get(Uri.parse(urlPetcare + '/dashboard/products-types'),
            headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <Service>[];
        for (var item in jsonData) {
          notes.add(Service.fromJson(item));
        }
        return APIResponse<List<Service>>(data: notes);
      }
      return APIResponse<List<Service>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<Service>>(
            error: true, errorMessage: 'An error occured'));
  }
}
