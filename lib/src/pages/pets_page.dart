import 'package:flutter/material.dart';
import 'package:petcare/src/services/pets_service.dart';
import 'package:provider/provider.dart';

class PetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final petsService = Provider.of<PetsService>(context);

    final mascotas = [
      'Dobby',
      'Chewbie',
      'Lana',
      'Firulays',
      'Doggo',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Mascotas'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Dobby'),
          ),
          Divider()
        ],
      ),
    );
  }
}
