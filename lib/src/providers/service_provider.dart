import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

import 'package:petcare/src/models/services_model.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';

//production:
//final urlPetcare = "https://petcaremobileapi.azurewebsites.net/api";
//local:
final urlPetcare = "https://localhost:44353/api";

class ServiceProvider with ChangeNotifier {
  // final String _firebaseToken = 'AIzaSyAzIGZax6Pn30zGytZkwyXJdEmsKiRDRc8';
  List<Service> lista = [];

  final _prefs = new PreferenciasUsuario();

/*   Future<Map<String, dynamic>> nuevaGuia( GuiaModel guia ) async{

    final data = {
      'numero'      : guia.numero,
      "archivo"     : guia.archivo,
      "id_usuario_creador": _prefs.iduser,
      "id_documento": guia.idDocumento,
      "fecha"       : guia.fecha,
      "monto_base"  : guia.montoBase,
      "igv"         : guia.igv,
      "monto_total" : guia.montoTotal,
      "id_entidad"  : guia.idEntidad,
      "latitud"     : guia.latitud,
      "longitud"    : guia.longitud,
      "token"       : _prefs.token  
      // 'token' : true
    };
    
    final resp = await http.post(
      'http://200.60.32.35/aplicaciones/Facturas/facturasws.nsf/xsp_ServicioFactura.xsp/guardarFactura',
      headers: <String, String>{'authorization':basicAuth},
      body: json.encode( data )
      );

      Map<String, dynamic> decodedResp = json.decode( resp.body );

      print( decodedResp );

      if( decodedResp.containsKey('token') ){
        //TO DO: guardar el token en el storage
        _prefs.token = decodedResp['token'];
        
        return { 'ok': true, 'mensaje' : 'Factura registrada con éxito!'};
      }else {
        return { 'ok': false, 'mensaje' : decodedResp['mensaje_error']};
      }


  }

 */

/* Future<Map<String, dynamic>> otraGuia( GuiaModel guia ) async{

    
      // "archivo"     : "FileFake",

    var map = new Map<String, dynamic>();
    map['numero'] = guia.numero.toString();
    map['id_usuario_creador'] = _prefs.iduser.toString();
    map['id_documento'] = guia.idDocumento.toString();
    map['fecha'] = guia.fecha;
    map['monto_base'] = guia.montoBase.toString();
    map['igv'] = guia.igv.toString();
    map['monto_total'] = guia.montoTotal.toString();
    map['id_entidad'] = guia.idEntidad.toString();
    map['latitud'] = guia.latitud.toString();
    map['longitud'] = guia.longitud.toString();
    map['token'] = _prefs.token;


    final data = {
      'numero'      : guia.numero,
      // "archivo"     : "FileFake",
      "id_usuario_creador": _prefs.iduser,
      "id_documento": guia.idDocumento,
      "fecha"       : guia.fecha,
      "monto_base"  : guia.montoBase,
      "igv"         : guia.igv,
      "monto_total" : guia.montoTotal,
      "id_entidad"  : guia.idEntidad,
      "latitud"     : guia.latitud,
      "longitud"    : guia.longitud,
      "token"       : _prefs.token  
    };


    final resp = await http.post(
      'http://200.60.32.35/aplicaciones/Facturas/facturasws.nsf/xsp_ServicioFactura.xsp/guardarFacturaFotoNoObligado',
      headers: <String, String>{'authorization':basicAuth},
      body: map
      // encoding: FormData( FormElement )
      );

      Map<String, dynamic> decodedResp = json.decode( resp.body );

      print( decodedResp );

      if( decodedResp.containsKey('token') ){
        //TO DO: guardar el token en el storage
        _prefs.token = decodedResp['token'];
        
        return { 'ok': true, 'mensaje' : 'Factura registrada con éxito!'};
      }else {
        return { 'ok': false, 'mensaje' : decodedResp['mensaje_error']};
      }


  }

 */

  // List<Guia> milista =new List<Guia>();

  Future<List<Service>> listServices() async {
    // try {
    var token = _prefs.token;
    final url =
        Uri.https('$urlPetcare', '/dashboard/products-types', {'q': '{http}'});
    final resp = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    // print("body: ${resp.body}");

    final decodedData = servicesModelFromJson(resp.body);

    // json.encode(strbody);
    // print("decoded : ${decodedData.guias} ");
    List<Service> servicio = [];

    if (resp.statusCode == 200) {
      if (decodedData.services.length < 1) return [];

      decodedData.services.forEach((i) {
        servicio.add(i);
      });

      return servicio;
    } else {
      print('Request failed with status: ${resp.statusCode}.');
    }
  }
}
