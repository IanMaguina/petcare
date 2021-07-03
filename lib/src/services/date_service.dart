import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:petcare/src/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/date.dart';
import 'package:petcare/src/models/veterinary.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';

class DateService {
  static const API = 'https://petcarefas.azurewebsites.net/api';
  static const headers = {
    // 'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471',
    'Content-Type': 'application/json'
  };

  PreferenciasUsuario _prefs = new PreferenciasUsuario();

  Future<APIResponse<List<Date>>> getdateList(String id) {
    final urlPetcare = _prefs.urlPetcare;
    final token = _prefs.token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEyIiwibmJmIjoxNjI1Mjc2OTIyLCJleHAiOjE2MjU4ODE3MjIsImlhdCI6MTYyNTI3NjkyMn0.u_HdPVpyOM7hT0kx7WAbwWtgTVOHq-Ts2N4j05ls8Og";
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };

    return http
        .get(Uri.parse(urlPetcare + '/people/' + id + '/requests'),
            headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <Date>[];
        for (var item in jsonData) {
          notes.add(Date.fromJson(item));
        }
        return APIResponse<List<Date>>(data: notes);
      }
      return APIResponse<List<Date>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<Date>>(
            error: true, errorMessage: 'An error occured'));
  }
}
