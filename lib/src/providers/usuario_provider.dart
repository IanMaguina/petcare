import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/user.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';

//production:
final urlPetcare = "https://petcaremobileapi.azurewebsites.net/api";
//local:
//final urlPetcare = 'https://10.0.2.2:44353/api';

/* String get urlPetcare {
  if (Platform.isAndroid) {
    return 'https://10.0.2.2:5001/api';
  } else {
    return 'https://localhost:5001/api';
  }
} */

class UsuarioProvider {
  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'username': email,
      'password': password,
      // 'returnSecureToken' : true
    };

    try {
      final url = Uri.parse('$urlPetcare' + '/users/authenticate');

      http.Response resp = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          },
          body: json.encode(authData));

      Map<String, dynamic> decodedResp = json.decode(resp.body);

      // print( decodedResp );
      if (resp.statusCode == 200) {
        if (decodedResp.containsKey('token')) {
          //TO DO: guardar el token en el storage
          _prefs.token = decodedResp['token'];
          _prefs.iduser = decodedResp['id'];

          return {'ok': true, 'token': decodedResp['token']};
        } else {
          return {'ok': false, 'mensaje': "Error al loguearse"};
        }
      }
    } catch (e) {
      print(e);
    }
  }

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
    final url = Uri.parse('$urlPetcare/people');

    http.Response resp = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode(data));
    if (resp.statusCode == 201) {
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
      return {'ok': false, 'mensaje': 'Error'};
    }
  }
}
