import 'package:flutter/material.dart';

class Cita {
  Cita({this.id, this.name, this.tipoServicio});
  int id;
  String name;
  String tipoServicio;
  factory Cita.fromJson(Map<String, dynamic> json) => Cita(
        id: json["id"],
        name: json["name"],
        tipoServicio: json["tipoServicio"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class ListarCitas extends StatelessWidget {
  final List<Cita> citas;

  const ListarCitas(this.citas);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.citas.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(child: _Citas(citas: this.citas[index], index: index));
      },
    );
  }
}

class _Citas extends StatelessWidget {
  final Cita citas;
  final int index;

  const _Citas({@required this.citas, @required this.index});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Container(
        height: 120.0,
        child: Column(children: <Widget>[
          SizedBox(height: 5.0),
          Text("TIPO DE CITA + HORA", style: TextStyle(fontSize: 20.0)),
          Text(citas.tipoServicio,
              style: TextStyle(fontSize: 14.0, color: Colors.grey)),
          SizedBox(height: 10.0),
          ElevatedButton(child: Text('Detalles'), onPressed: () {}),
        ]),
      ),
    );
  }
}
