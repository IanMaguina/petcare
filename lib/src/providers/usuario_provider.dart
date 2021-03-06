import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/user.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';

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
    final urlPetcare = _prefs.urlPetcare;
    final authData = {
      'username': email,
      'password': password,
      // 'returnSecureToken' : true
    };
    bool _state = false;
    dynamic _message;
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
          _state = true;
          _message = decodedResp['token'];
          // return {'ok': _state, 'token':_message};
        } else {
          _state = false;
          _message = "Error al loguearse";
          // return {'ok': false, 'mensaje': };
        }
      }
    } catch (e) {
      print(e);
      _state = false;
      _message = e;
      // return {'ok': false, 'mensaje': "Error al loguearse"};
    }
    return {'ok': _state, 'token': _message};
  }

  Future<Map<String, dynamic>> nuevoUsuario(User user) async {
    final urlPetcare = _prefs.urlPetcare;

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
