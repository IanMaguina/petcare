import 'package:flutter/material.dart';

class ListVeterinariesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final veterinaryService = Provider.of<VeterinaryService>(context);
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white),
        title: Text(
          "Lista de Veterinarias por Servicio",
        ),
      ),
      body: SafeArea(
          top: true,
          child: Container(
            padding: EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              _veterinaria(context),
            ]),
          )),
    );
  }

  Widget _veterinaria(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: _fotoVeterinaria("assets/images/local3.png"),
          title: _nombreVeterinaria("nombre"),
          subtitle: _direccionveterinaria("direccion"),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Color.fromRGBO(57, 179, 179, 1),
          ),
          onTap: () {
            Navigator.pushNamed(context, 'veterinarydetail');
          },
        ),
        Divider(),
      ],
    );
  }

  _fotoVeterinaria(String url) {
    return Image(
      image: AssetImage(url),
    );
  }

  _nombreVeterinaria(String nombre) {
    return Text(nombre);
  }

  _direccionveterinaria(String dir) {
    return Text(dir);
  }
}
