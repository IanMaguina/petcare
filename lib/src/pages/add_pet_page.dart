import 'package:flutter/material.dart';
import 'package:petcare/src/models/pet.dart';

class AddPetPage extends StatefulWidget {
  @override
  _AddPetPageState createState() => _AddPetPageState();
}

class _AddPetPageState extends State<AddPetPage> {
  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Pet pet = new Pet();
  // final petProvider = new UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Mascota'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(50),
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                _crearNombre(),
                _crearEdad(),
                _crearRaza(),
                _crearSexo(),
                _crearFoto(),
                _crearBoton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: "",
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre de mascota'),
      onSaved: (value) => pet.name = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Contraseña es requerido';
        }
        if (value.length < 3) {
          return 'minimo 6 caracteres';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearSexo() {
    return TextFormField(
      initialValue: "",
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Sexo (F) o (M)'),
      onSaved: (value) => pet.sex = value,
    );
  }

  Widget _crearFoto() {
    return TextFormField(
      initialValue: pet.photo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Url de imagen'),
      onSaved: (value) => pet.photo = value,
    );
  }

  Widget _crearRaza() {
    return TextFormField(
      initialValue: pet.breed,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Raza'),
      onSaved: (value) => pet.breed = value,
    );
  }

  Widget _crearEdad() {
    return TextFormField(
      initialValue: "",
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Edad'),
      onSaved: (value) => pet.age = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Debe ingresar una Edad';
        }
        return null;
      },
    );
  }

  Widget _crearBoton(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        primary: Color.fromRGBO(57, 179, 179, 1.0),
        textStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      label: Text('Registrar'),
      icon: Icon(Icons.save),
      onPressed: () {
        _submit(context);
      },
    );
  }

  void _submit(BuildContext context) async {
    if (!formkey.currentState.validate()) {
      return;
    }
  }
}
