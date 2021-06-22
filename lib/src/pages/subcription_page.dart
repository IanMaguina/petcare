import 'package:flutter/material.dart';

class SubcriptionPage extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: true,
      child: ListView(
        children: [
          _element(context, "Limitado", "s/.0.00"),
          Divider(),
          _element(context, "Básico", "s/.10.00"),
          Divider(),
          _element(context, "Estándar", "s/.30.00"),
          Divider(),
          _element(context, "VIP", "s/.65.00"),
          Divider(),
        ],
      ),
    ));
  }
}

Widget _element(BuildContext context, String service, String pago) {
  return ListTile(
    leading: Icon(
      Icons.monetization_on,
      color: Color.fromRGBO(57, 179, 179, 1),
    ),
    contentPadding: EdgeInsets.all(10),
    title: Text(service),
    subtitle: Text("pago mensual : $pago"),
    hoverColor: Color.fromRGBO(57, 179, 179, 0.3),
    trailing: Icon(
      Icons.arrow_forward_ios,
      color: Color.fromRGBO(57, 179, 179, 1),
    ),
    onTap: () {
      //Navigator.pushNamed(context, 'listvets');
    },
  );
}
