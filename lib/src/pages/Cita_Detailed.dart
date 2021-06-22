import 'package:flutter/material.dart';
import 'package:petcare/src/widgets/ListarCitas/Cita_Detailed_Vet.dart';

class ListarCitasDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Detalle de Citas',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new CitaDetailedVet(),
      debugShowCheckedModeBanner: false,
    );
  }
}
