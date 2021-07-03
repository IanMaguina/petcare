import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:petcare/src/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/appointment.dart';
import 'package:petcare/src/models/date.dart';
import 'package:petcare/src/models/pet.dart';
import 'package:petcare/src/models/product.dart';
import 'package:petcare/src/pages/veterinary_detail_page.dart';
import 'package:petcare/src/providers/usuario_provider.dart';
import 'package:petcare/src/models/veterinary.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';

class DateService {
  static const API = 'https://petcarefas.azurewebsites.net/api';

  final _prefs = new PreferenciasUsuario();

  //Miguel date
  Future<APIResponse<bool>> createDate(Appointment date) {
    final urlPetcare = _prefs.urlPetcare;
    var token = _prefs.token;
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };
    final idUser = _prefs.iduser.toString(); //id usuario
    final datereservation = date.dateReservation.toString(); //fecha
    final starttime = date.startTime.toString(); //hora inicio
    final endtime = "14:00"; //hora final
    final idVetDP = date.providerId.toString(); //idveterinaria
    final idPet = date.petId.toString();
    final idProd = date.productId.toString(); //id servicio
    final typeProdId = "9";
    //final idAppoint = appot.
    final cita = {
      "datereservation": datereservation,
      "starttime": starttime,
      "endtime": endtime
    };
    //var jsonv = cita.toJson();
    return http
        .post(
            Uri.parse(urlPetcare +
                '/people/$idUser/pets/$idPet/providers/$idVetDP/product-types/$typeProdId/products/$idProd/requests'),
            headers: headers,
            body: json.encode(cita))
        .then((data) {
      if (data.statusCode == 200) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<List<Appointment>>> getdateList() {
    final urlPetcare = _prefs.urlPetcare;
    final iduser = _prefs.iduser.toString();
    final token = _prefs.token;
    print("id de usuario es " + token.toString());
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };

    return http
        .get(Uri.parse(urlPetcare + '/people/' + iduser + '/requests'),
            headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <Appointment>[];
        for (var item in jsonData) {
          notes.add(Appointment.fromJson(item));
        }
        return APIResponse<List<Appointment>>(data: notes);
      }
      return APIResponse<List<Appointment>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<Appointment>>(
            error: true, errorMessage: 'An error occured'));
  }
}
