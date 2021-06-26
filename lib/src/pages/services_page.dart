/* import 'package:flutter/material.dart';
import 'package:petcare/src/borrar/services_model.dart';
import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/models/type_service.dart';
import 'package:petcare/src/services/service_service.dart';
import 'package:petcare/src/utils/icon_string.dart';

class ListServicesPage extends StatefulWidget {
  @override
  _ListServicesPageState createState() => _ListServicesPageState();
}

class _ListServicesPageState extends State<ListServicesPage> {
  final servicesProvider = ServicesService();
  APIResponse<List<Service>> serv;

  @override
  void initState() {
    super.initState();
    this.servicesProvider.getServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            top: true,
            child: ListView.builder(
              itemCount: serv.data.length,
              itemBuilder: (context, i) => _element(context, serv.data[i]),
            )));
  }
}

Widget _element(BuildContext context, Service service) {
  return ListTile(
    leading: Icon(Icons.supervised_user_circle),
    contentPadding: EdgeInsets.all(10),
    title: Text(service.name),
    hoverColor: Color.fromRGBO(57, 179, 179, 0.3),
    trailing: Icon(
      Icons.arrow_forward_ios,
      color: Color.fromRGBO(57, 179, 179, 1),
    ),
    onTap: () {
      Navigator.pushNamed(context, 'listvets');
    },
  );
}
 */

import 'package:flutter/material.dart';
import 'package:petcare/src/models/type_service.dart';
import 'package:petcare/src/services/service_service.dart';
import 'package:petcare/src/utils/icon_string.dart';

class ListServicesPage extends StatelessWidget {
  //final servicesProvider = ServicesService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: true,
      child: ListView(
        children: [
          _element(context, "Baños", "baño"),
          Divider(),
          _element(context, "Campaña de Vacunación", "vaccine"),
          Divider(),
          _element(context, "Profilaxis Dental", "dental"),
          Divider(),
          _element(context, "Consulta médica", "cita"),
          Divider(),
          _element(context, "Cultivo", "cultivo"),
          Divider(),
          _element(context, "Guarderia", "guarderia"),
          Divider(),
        ],
      ),
    ));
  }
}

Widget _element(BuildContext context, String service, String icon) {
  return ListTile(
    leading: getIcon(icon),
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
  );
}
