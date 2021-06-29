import 'dart:convert';
import 'dart:math';
import 'package:petcare/src/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/date.dart';
import 'package:petcare/src/models/veterinary.dart';

class DateService {
  static const API = 'https://petcarefas.azurewebsites.net/api';
  static const headers = {
    // 'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471',
    'Content-Type': 'application/json'
  };

  Future<APIResponse<List<Date>>> getdateList(String id) {
    return http
        .get(Uri.parse(API + '/people/' + id + 'requests'), headers: headers)
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
