import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petcare/src/models/productv.dart';
import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/models/providerjoinproduct.dart';
import 'package:petcare/src/models/service_.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/productv.dart';
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

  Future<APIResponse<bool>> createService(Productv item,String provid,String token) {
    final urlPetcare = _prefs.urlPetcare;
    return http
        .post(Uri.parse(urlPetcare + '/business/$provid/providers/$provid/typeproduts/'+item.TypeProductId.toString()+'/products'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        }, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
        APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }
  Future<APIResponse<List<Productv>>> getProductsList(Providerjoinproduct item,String token) {

    final urlPetcare = _prefs.urlPetcare;
    return http
        .get(Uri.parse(urlPetcare + '/business/${item.providerId}/providers/${item.providerId}/typeproduts/${item.typeProductId}/products'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        })
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <Productv>[];
        for (var item in jsonData) {
          notes.add(Productv.fromJson(item));
        }
        return APIResponse<List<Productv>>(data: notes);
      }
      return APIResponse<List<Productv>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<Productv>>(
        error: true, errorMessage: 'An error occured'));
  }



}

