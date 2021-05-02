import 'package:flutter/material.dart';
import 'package:petcare/src/pages/add_pet.dart';

class HomePageTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Perfil usuario'),
      bottomNavigationBar: Center(
        child: IconButton(
          icon: Icon(Icons.pets),
          onPressed: () {
            final route = MaterialPageRoute(builder: (context) => AddPetPage());

            Navigator.push(context, route);
          },
        ),
      ),
    );
  }
}
