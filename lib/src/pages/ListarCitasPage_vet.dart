import 'package:flutter/material.dart';
import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/models/appointment.dart';
import 'package:petcare/src/models/date.dart';
import 'package:petcare/src/models/product.dart';
import 'package:petcare/src/models/type_service.dart';
import 'package:petcare/src/pages/Cita_Detailed.dart';
import 'package:petcare/src/services/date_service.dart';
import 'package:petcare/src/services/products_service.dart';
import 'package:petcare/src/services/type_service_service.dart';
import 'package:petcare/src/widgets/ListarCitas/Cita_Detailed_Vet.dart';

class ListarCitasVetPage extends StatefulWidget {
  @override
  _ListarCitasPageState createState() => _ListarCitasPageState();
}

class _ListarCitasPageState extends State<ListarCitasVetPage> {
  DateService dateprovider = new DateService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: FutureBuilder(
          future: dateprovider.getdateList(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final List<Appointment> listaCitas = snapshot.data.data;
              return ListView.builder(
                itemCount: listaCitas.length,
                itemBuilder: (BuildContext context, int index) {
                  final date = listaCitas[index];
                  final product = snapshot.data.data[index];
                  return _element(context, product);
                },
              );
            }
          },
        ),
      ),
    );
  }
}

_element(BuildContext context, Appointment citas) {
  return ListTile(
      contentPadding: EdgeInsets.all(10),
      leading: Icon(Icons.date_range),
      title: (Text.rich(
        TextSpan(
          text: citas.petName,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      )),
      subtitle: Text(citas.startTime),
      hoverColor: Color.fromRGBO(57, 179, 179, 0.3),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Color.fromRGBO(57, 179, 179, 1),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CitasDetailVetPage(citas),
          ),
        );
      });
}
