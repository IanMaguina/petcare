import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petcare/src/models/pet.dart';
import 'package:petcare/src/pages/list_pet_page.dart';
import 'package:petcare/src/services/pets_service.dart';

class EditPetPage extends StatefulWidget {
  final Pet pt;
  EditPetPage(this.pt);
  @override
  _EditPetPageState createState() => _EditPetPageState(pt);
}

class _EditPetPageState extends State<EditPetPage> {
  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  PetsService perService = new PetsService();

  Pet pet = new Pet();
  _EditPetPageState(this.pet);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar datos de la mascota'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(50),
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                _editarNombre(),
                SizedBox(height: 10),
                _editarAge(),
                SizedBox(height: 10),
                _editarRaza(),
                SizedBox(height: 10),
                _editarSexo(),
                SizedBox(height: 10),
                _editarBoton(context),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _editarNombre() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: pet.name.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre'),
      onSaved: (value) => pet.name = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'El nombre no puede estar vacio';
        }
        if (value.length < 2) {
          return 'minimo 3 caracteres';
        } else {
          return null;
        }
      },
    );
  }

  Widget _editarRaza() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: pet.breed.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Raza'),
      onSaved: (value) => pet.breed = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'La raza no puede estar vacía';
        } else {
          return null;
        }
      },
    );
  }

  Widget _editarSexo() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: pet.sex.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Sexo'),
      onSaved: (value) => pet.sex = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'El sexo no puede estar vacío';
        } else {
          return null;
        }
      },
    );
  }

  Widget _editarAge() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: pet.age.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Edad'),
      onSaved: (value) => pet.age = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'La edad no puede estar vacía';
        }
        if (value.length <= 0) {
          return 'mínimo 1 caracter';
        } else {
          return null;
        }
      },
    );
  }

  Widget _editarBoton(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        primary: Color.fromRGBO(57, 179, 179, 1.0),
        textStyle: TextStyle(color: Colors.white, fontSize: 18),
      ),
      label: Text('Actualizar'),
      icon: Icon(Icons.save),
      onPressed: () {
        _submit(context);
      },
    );
  }

  void _submit(BuildContext context) async {
    //Obtiene todos los pets

    formkey.currentState.save();
    //print(list);
    print("MASCOTAS: ");
    print(pet.name);
    print(pet.age);
    print(pet.breed);
    print(pet.sex);
    print("     ");

    final result1 =
        await perService.updatePetByCustomerId(pet.id.toString(), pet);

    if (!result1.error) {
      print(result1);

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ListPetPage(),
      ));
      Fluttertoast.showToast(msg: "Mascota ${pet.name} actualizada !");
    } else {
      Fluttertoast.showToast(msg: result1.errorMessage);
    }
  }
}
