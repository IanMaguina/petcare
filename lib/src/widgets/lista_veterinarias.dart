import 'package:flutter/material.dart';
import 'package:petcare/src/models/veterinary.dart';

class ListVeterinaries extends StatelessWidget {
  final List<Veterinary> veterinarias;

  const ListVeterinaries(this.veterinarias);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.veterinarias.length,
      itemBuilder: (BuildContext context, int index) {
        return _Veterinaria(
            veterinaria: this.veterinarias[index], index: index);
      },
    );
  }
}

class _Veterinaria extends StatelessWidget {
  final Veterinary veterinaria;
  final int index;

  const _Veterinaria({@required this.veterinaria, @required this.index});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Container(
        height: 150.0,
        child: Column(children: <Widget>[
          SizedBox(height: 5.0),
          Text(veterinaria.businessName, style: TextStyle(fontSize: 20.0)),
          Text(veterinaria.address, style: TextStyle(fontSize: 12.0)),
          Text(
            veterinaria.region,
            style: TextStyle(fontSize: 12.0),
          ),
          SizedBox(height: 10.0),
          ElevatedButton(child: Text('Ver veterinaria'), onPressed: () {}),
        ]),
      ),
    );
  }
}
