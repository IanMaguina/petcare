import 'package:flutter/material.dart';
import 'package:petcare/src/widgets/CustomWidgets.dart';

class ListarCitasVetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final servicesService = Provider.of<ServicesService>(context);
    return Scaffold(
        body: SafeArea(
      top: true,
      child: ListView(
        children: [
          _element(context, "8AM - 10 PM", "Ducha Antipulgas"),
          Divider(),
          _element(context, "10AM - 12 PM", "Revision Medica"),
          Divider(),
          _element(context, " 3 PM - 4 PM", "Actividad Dental"),
          Divider(),
          _element(context, "4PM - 6 PM", "Consulta Medica"),
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
      Navigator.pushNamed(context, 'detallecita');
    },
  );
}
