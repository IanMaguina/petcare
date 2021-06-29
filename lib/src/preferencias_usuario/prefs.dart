import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get urlPetcare {
    return _prefs.getString('urlPetcare') ?? "https://10.0.2.2:5001/api";
    //return _prefs.getString('url') ?? "https://petcarefas.azurewebsites.net/api";
  }

  set urlPetcare(String value) {
    _prefs.setString('urlPetcare', value);
  }

  // GET y SET del nombre
  get token {
    return _prefs.getString('token');
  }

  set token(String value) {
    _prefs.setString('token', value);
  }

  get iduser {
    return _prefs.getInt('iduser');
  }

  set iduser(int value) {
    _prefs.setInt('iduser', value);
  }

//?? ___ : el id usuario veterinario que quieras probar
  get idvet {
    return _prefs.getInt('idvet');
  }

  set idvet(int value) {
    _prefs.setInt('idvet', value);
  }

  get pass {
    return _prefs.getString('pass') ?? '';
  }

  set pass(String value) {
    _prefs.setString('pass', value);
  }

  // GET y SET de la última página
  /* get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'login';
  }

  set ultimaPagina( String value ) {
    _prefs.setString('ultimaPagina', value);
  } */

}
