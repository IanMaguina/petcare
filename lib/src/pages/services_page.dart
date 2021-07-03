import 'package:flutter/material.dart';
import 'package:petcare/src/models/service_.dart';
import 'package:petcare/src/pages/list_favveterinarias.dart';
import 'package:petcare/src/services/service_service.dart';

class ListServicesPage extends StatefulWidget {
  @override
  _ListServicesPageState createState() => _ListServicesPageState();
}

class _ListServicesPageState extends State<ListServicesPage> {
  final servicesProvider = ServicesService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            top: true,
            child: FutureBuilder(
              future: this.servicesProvider.getServices(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  final List<Service> listaserv = snapshot.data.data;
                  return _ListaServicios(listaserv);
                }
              },
            )));
  }
}

class _ListaServicios extends StatelessWidget {
  final List<Service> servicios;
  const _ListaServicios(this.servicios);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: servicios.length,
      itemBuilder: (BuildContext context, int index) {
        final service = servicios[index];
        return _element(context, service);
      },
    );
  }
}

Widget _element(BuildContext context, Service service) {
  return ListTile(
    leading: Icon(Icons.supervised_user_circle),
    contentPadding: EdgeInsets.all(10),
    title: Text(service.name),
    hoverColor: Color.fromRGBO(57, 179, 179, 0.3),
    trailing: IconButton(
      icon: Icon(
        Icons.arrow_forward_ios,
        color: Color.fromRGBO(57, 179, 179, 1),
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HeadVeterinaryList(),
        ));
      },
    ),
    /* onTap: () {
      Navigator.pushNamed(context, 'listvets');
    }, */
  );
}
