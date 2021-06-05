import 'package:flutter/material.dart';
import 'package:petcare/src/widgets/CustomWidgets.dart';

class MedicalHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final servicesService = Provider.of<ServicesService>(context);
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          top: true,
          child: ListView(
            children: [
              _element(context, "Cita 20/04/2020", "Observaciones: Medicacion"),
              Divider(),
              _element(context, "Cita 15/04/2020", "Observaciones: Alergia"),
              Divider(),
              _element(
                  context, " Cita 10/03/2020", "Obesrvaciones: Mejorar Dieta"),
              Divider(),
              _element(
                  context, "Cita 15/02/2020", "Observaciones: Necesita baño"),
              Divider(),
            ],
          ),
        ));
  }
}

_element(BuildContext context, String service, String tipoServicio) {
  return ListTile(
    contentPadding: EdgeInsets.all(10),
    leading: Icon(Icons.date_range),
    title: (Text.rich(
      TextSpan(
        text: service,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    )),
    subtitle: Text(tipoServicio),
    hoverColor: Color.fromRGBO(57, 179, 179, 0.3),
    trailing: Icon(
      Icons.arrow_forward_ios,
      color: Color.fromRGBO(57, 179, 179, 1),
    ),
    onTap: () {
      Navigator.pushNamed(context, 'vetplaces');
    },
  );
}
