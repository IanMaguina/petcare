import 'package:flutter/material.dart';
import 'package:petcare/src/services/pets_service.dart';
import 'package:petcare/src/widgets/lista_pets.dart';
import 'package:provider/provider.dart';

class PetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final petsService = Provider.of<PetsService>(context);

    /*  final mascotas = [
      'Dobby',
      'Chewbie',
      'Lana',
      'Firulays',
      'Doggo',
    ]; */

    return Scaffold(
      body: ListPets(petsService.listadoPets),
    );
  }
}
