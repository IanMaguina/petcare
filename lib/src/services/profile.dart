import 'package:http/http.dart';
import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/user.dart';

final urlPetcare = "https://petcarefas.azurewebsites.net/api";

class Profile{
  String name;
  String lastName;
  String age;
  String phone;
  String email;
  String document;
  String photo;






PreferenciasUsuario prefs;


Future<APIResponse<void>> updateData() async {
    final userId  = await prefs.iduser;
    final url = '$urlPetcare/people';

    final body ={
      'name' : name,
      'lastName':lastName,
      'age':age,
      'phone':phone,
      'email':email,
      'document':document,
      'photo':photo,

    };


    try{
      Response response = await http.get(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      print(response.statusCode);

    }
    catch(e){
      print('caught error $e');
    }
  }
}

