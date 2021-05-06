import 'package:flutter/material.dart';

class ListVeterinariesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* String title;
  String name;
  String address;
  String image;

  Vet(this.title,this.name,this.address,this.image);

  static List<Vet> vets(){
    return[Vet("Amaperros","Amadores de Perros","Av.Los lirios","img/local1.png"),
    Vet("Rata","Amadores de Perros","Av.Los lirios","img/local2.png"),
    Vet("Sopa","Amadores de Perros","Av.Los lirios","img/local3.png"),
    Vet("Sopa","Amadores de Perros","Av.Los lirios","img/local4.png")];
  }
} */

    return ListView(
      children: [
        ListTile(leading: Text('Clerical Vets')),
        ListTile(leading: Text('Carval')),
        ListTile(leading: Text('Caritas ')),
        ListTile(leading: Text('Animal Heart')),
        ListTile(
            leading: Text(
          'Animal Care',
        ))
      ],
    );
  }
}
