import 'package:flutter/material.dart';
import 'package:petcare/src/models/service.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';
import 'package:petcare/src/services/service_service.dart';
import 'package:petcare/src/utils/icon_string.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListServicesPageCopy extends StatefulWidget {
  @override
  _ListServicesPageCopyState createState() => _ListServicesPageCopyState();
}

class _ListServicesPageCopyState extends State<ListServicesPageCopy> {
  //final servicesServ = ServicesService();
  final _prefs = new PreferenciasUsuario();

  String urlPetcare = "https://192.168.56.1:44353/api";
  List datalist = [];
  dynamic data;

  Future<String> makeResquest() async {
    var token = _prefs.token;

    /* final url =
        Uri.https('$urlPetcare', '/dashboard/products-types', {'q': '{http}'}); */
    final response = await http.get(Uri.parse('$urlPetcare/people'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    setState(() {
      var encodedata = json.encode(response.body);
      var decodeData = json.decode(encodedata);
      data = decodeData;
      datalist.add(data);
    });

    print("Nombre: " + datalist[0]["name"]);
    return datalist.toString();
  }

  @override
  void initState() {
    super.initState();
    this.makeResquest();
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: datalist.length,
      itemBuilder: (BuildContext context, i) {
        return _element(context, datalist[i]["name"].toString());
      },
    );
  }
}

Widget _element(BuildContext context, String service) {
  return Column(children: <Widget>[
    ListTile(
      /* leading: getIcon(icon), */
      contentPadding: EdgeInsets.all(10),
      title: Text(service),
      hoverColor: Color.fromRGBO(57, 179, 179, 0.3),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Color.fromRGBO(57, 179, 179, 1),
      ),
      onTap: () {
        Navigator.pushNamed(context, 'listvets');
      },
    ),
    Divider(),
  ]);
}
