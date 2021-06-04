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
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container( 
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/pet1.jpg'),
                    fit: BoxFit.cover
                  )
                ),
              ),
              Text("Bella, 3 años"),
              Icon(Icons.add,),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container( 
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/pet1.jpg'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Text("Koke, 2 años"),
                Icon(Icons.add,),
              ],
            ),
          ),
        ],
      ),
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
