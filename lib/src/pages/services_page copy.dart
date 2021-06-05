import 'package:flutter/material.dart';
import 'package:petcare/src/models/service.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';
import 'package:petcare/src/services/service_service.dart';
import 'package:petcare/src/utils/icon_string.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListServicesPage extends StatefulWidget {
  @override
  _ListServicesPageState createState() => _ListServicesPageState();
}

class _ListServicesPageState extends State<ListServicesPage> {
  //final servicesServ = ServicesService();
  final _prefs = new PreferenciasUsuario();

  String urlPetcare = "https://10.0.2.2:44353/api";
  List data = [];

  Future<String> makeResquest() async {
    var token = _prefs.token;

    /* final url =
        Uri.https('$urlPetcare', '/dashboard/products-types', {'q': '{http}'}); */
    final response = await http
        .get(Uri.parse('$urlPetcare/dashboard/products-types'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata;
    });

    print("Nombre: " + data[0]["name"]);
    return response.body.toString();
  }

  @override
  void initState() {
    super.initState();
    this.makeResquest();
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, i) {
        return _element(context, data[i]["name"].toString());
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
