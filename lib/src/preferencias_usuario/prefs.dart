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

  // GET y SET del nombre
  get token {
    return _prefs.getString('token') ??
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEyIiwibmJmIjoxNjIyODg0NDI0LCJleHAiOjE2MjM0ODkyMjQsImlhdCI6MTYyMjg4NDQyNH0.O1FVC_7A_lEBBtpSKqK_PVHtigthY18rtRsqrxj_zNU';
  }

  set token(String value) {
    _prefs.setString('token', value);
  }

  get iduser {
    return _prefs.getInt('iduser') ?? 12;
  }

  set iduser(int value) {
    _prefs.setInt('iduser', value);
  }
/*   get user {
    return _prefs.getString('user') ?? '';
  } 
  set user( String value ) {
    _prefs.setString('user', value);
  }

  
  get pass {
    return _prefs.getString('pass') ?? '';
  } 
  set pass( String value ) {
    _prefs.setString('pass', value);
  } */

  // GET y SET de la última página
  /* get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'login';
  }

  set ultimaPagina( String value ) {
    _prefs.setString('ultimaPagina', value);
  } */

}
