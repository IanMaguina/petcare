import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/models/pet.dart';

final apiKey = "";
final token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjkiLCJuYmYiOjE2MjA0NTIxOTgsImV4cCI6MTYyMTA1Njk5OCwiaWF0IjoxNjIwNDUyMTk4fQ.G-jOetqvYbgACErTLsF3iimKNKeHSZooUXX0YH8LXFI";

class PetsService {
  static const API = 'https://petcarefas.azurewebsites.net/api';
  static const headers = {
    // 'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471',
    'Content-Type': 'application/json'
  };

  Future<APIResponse<List<Pet>>> getPetByCustomerId(String id) {
    return http
        .get(Uri.parse(API + '/people/' + id + '/pets'), headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <Pet>[];
        for (var item in jsonData) {
          notes.add(Pet.fromJson(item));
        }
        return APIResponse<List<Pet>>(data: notes);
      }
      return APIResponse<List<Pet>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<Pet>>(
            error: true, errorMessage: 'An error occured'));
  }
}
