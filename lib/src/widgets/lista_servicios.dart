import 'package:flutter/material.dart';
import 'package:petcare/src/models/service.dart';

class ListServices extends StatelessWidget {
  //final List<Service> servicios;

  final List<Service> servicios = [
    {"id": 1, "name": "Baños"},
    {"id": 2, "name": "Vacunaciones"},
    {"id": 3, "name": "Ortodoncia"}
  ];
  const ListServices(this.servicios);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.servicios.length,
      itemBuilder: (BuildContext context, int index) {
        return _Servicio(servicio: this.servicios[index], index: index);
      },
    );
  }
}

class _Servicio extends StatelessWidget {
  final Service servicio;
  final int index;

  const _Servicio({@required this.servicio, @required this.index});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Container(
        height: 120.0,
        child: Column(children: <Widget>[
          SizedBox(height: 5.0),
          Text(servicio.name, style: TextStyle(fontSize: 20.0)),
          Icon(
            Icons.clear,
            size: 10.0,
          ),
          SizedBox(height: 10.0),
          RaisedButton(child: Text('Buscar por Servicio'), onPressed: () {}),
        ]),
      ),
    );
  }
}
