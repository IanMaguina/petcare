import 'package:flutter/material.dart';
import 'package:petcare/src/models/pet.dart';

class ListPets extends StatelessWidget {
  final List<Pet> pets;

  const ListPets(this.pets);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.pets.length,
      itemBuilder: (BuildContext context, int index) {
        return _Pet(pet: this.pets[index], index: index);
      },
    );
  }
}

class _Pet extends StatelessWidget {
  final Pet pet;
  final int index;

  const _Pet({@required this.pet, @required this.index});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Container(
        height: 120.0,
        child: Column(children: <Widget>[
          SizedBox(height: 5.0),
          Text(pet.name, style: TextStyle(fontSize: 18.0)),
          Icon(
            Icons.pets,
            size: 12.0,
          ),
          SizedBox(height: 10.0),
          Text("Edad : " + pet.age, style: TextStyle(fontSize: 12.0)),
          Text("Género" + pet.sex, style: TextStyle(fontSize: 12.0)),
        ]),
      ),
    );
  }
}
