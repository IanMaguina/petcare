import 'package:flutter/material.dart';
//import 'package:petcare/src/pages/CardVet.dart';

class ListPet extends StatelessWidget {
  static const routeName = '/ListPets';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: Mascotas());
  }
}

class Mascotas extends StatefulWidget {
  @override
  _MascotasState createState() => _MascotasState();
}

class _MascotasState extends State<Mascotas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: pets(),
    );
  }
}

Widget pets() {
  return ListTile(
    contentPadding: EdgeInsets.all(12),
    leading: Image(
      image: AssetImage('assets/images/perrito.png'),
    ),
    trailing: Icon(Icons.add),
  );
}
