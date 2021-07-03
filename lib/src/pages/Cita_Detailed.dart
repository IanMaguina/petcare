import 'package:flutter/material.dart';
import 'package:petcare/src/models/appointment.dart';
import 'package:petcare/src/widgets/ListarCitas/Cita_Detailed_Vet.dart';

class ListarCitasDetailPage extends StatelessWidget {
  final Appointment cita;
  ListarCitasDetailPage(this.cita);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Detalle de Citas',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new CitaDetailedVet(cita),
      debugShowCheckedModeBanner: false,
    );
  }
}
