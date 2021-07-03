import 'package:flutter/material.dart';
import 'package:petcare/src/models/type_service.dart';

class ListaServicios extends StatelessWidget {
  final List<TypeService> servicios;

  ListaServicios(this.servicios);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: true,
      child: ListView.builder(
        itemCount: this.servicios.length,
        itemBuilder: (BuildContext context, int index) {
          return _Servicio(
            servicio: this.servicios[index],
            index: index,
          );
        },
        /*  children: [
          _element(context, "Baños", "baño"),
          Divider(),
          _element(context, "Campaña de Vacunación", "vaccine"),
          Divider(),
          _element(context, "Profilaxis Dental", "dental"),
          Divider(),
          _element(context, "Consulta médica", "cita"),
          Divider(),
          _element(context, "Cultivo", "cultivo"),
          Divider(),
          _element(context, "Guarderia", "guarderia"),
          Divider(),
        ], */
      ),
    ));
  }
}

class _Servicio extends StatelessWidget {
  final TypeService servicio;
  final int index;
  const _Servicio({@required this.servicio, @required this.index});

  @override
  Widget build(BuildContext context) {
    return _Element(servicio, index);
  }
}

class _Element extends StatelessWidget {
  final TypeService servicio;
  final int index;
  const _Element(this.servicio, this.index);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //leading: getIcon(icon),
      contentPadding: EdgeInsets.all(10),
      title: Text('${servicio.name}'),
      hoverColor: Color.fromRGBO(57, 179, 179, 0.3),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Color.fromRGBO(57, 179, 179, 1),
      ),
      onTap: () {
        Navigator.pushNamed(context, 'listvets');
      },
    );
  }
}
