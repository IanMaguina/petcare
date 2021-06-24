import 'package:flutter/material.dart';
import 'package:petcare/src/models/uservet.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/veterinary.dart';
import 'package:petcare/src/services/user_vet_service.dart';

class EditUservetPage extends StatefulWidget {
  final Uservet vet;
  EditUservetPage(this.vet);
  @override
  _EditUservetState createState() => _EditUservetState(vet);
}

class _EditUservetState extends State<EditUservetPage> {
  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  UservService vetService = new UservService();

  Uservet veterinario = new Uservet();
  _EditUservetState(this.veterinario);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar datos de veterinario'),
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
                _editarLastName(),
                SizedBox(height: 10),
                _editarDocument(),
                SizedBox(height: 10),
                _editarEmail(),
                SizedBox(height: 10),
                _editarPassword(),
                SizedBox(height: 10),
                _editarPhone(),
                SizedBox(height: 10),
                _editarAge(),
                SizedBox(height: 10),
                _editarBoton(context),
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
      initialValue: veterinario.name.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre del veterinario'),
      onSaved: (value) => veterinario.name = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'El nombre no puede estar vacio';
        }
        if (value.length < 3) {
          return 'minimo 3 caracteres';
        }
        if (value.length > 30) {
          return 'maximo 30 caracteres';
        } else {
          return null;
        }
      },
    );
  }

  Widget _editarLastName() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: veterinario.lastName.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Apellido del Dueño'),
      onSaved: (value) => veterinario.lastName = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'La region no puede estar en blanco';
        }
        if (value.length < 3) {
          return 'minimo 3 caracteres';
        }
        if (value.length > 30) {
          return 'maximo 30 caracteres';
        } else {
          return null;
        }
      },
    );
  }

  Widget _editarDocument() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: veterinario.document.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Documento del Dueño '),
      onSaved: (value) => veterinario.document = int.parse(value),
      validator: (value) {
        if (value.isEmpty) {
          return 'Documento es requerido';
        }
        if (value.length != 8) {
          return 'DNI Invalido';
        }
        if (value.contains(RegExp('[A-Z]'))) {
          return 'DNI no pude incluir letras A-Z';
        } else {
          return null;
        }
      },
    );
  }

  Widget _editarEmail() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: veterinario.email.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Correo electronico'),
      onSaved: (value) => veterinario.email = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'El correo elctronico no puede estar vacio';
        }
        if (!value.contains('@')) {
          return 'Correo electronico invalido';
        } else {
          return null;
        }
      },
    );
  }

  Widget _editarPassword() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: veterinario.password.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Contraseña'),
      onSaved: (value) => veterinario.password = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Debe ingresar una contraseña';
        }
        if (value.length <= 8) {
          return 'Mininimo 8 caracteres para la contraseña';
        } else {
          return null;
        }
      },
    );
  }

  Widget _editarPhone() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: veterinario.phone.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Telefono Celular'),
      onSaved: (value) => veterinario.document = int.parse(value),
      validator: (value) {
        if (value.isEmpty) {
          return 'Contraseña es requerido';
        }
        if (value.length != 9) {
          return 'La cantidad de digitos no puede ser distinta de 9';
        }
        if (value.contains(RegExp('[A-Z]'))) {
          return 'Telefono no pude incluir letras A-Z';
        } else {
          return null;
        }
      },
    );
  }

  Widget _editarAge() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: veterinario.age.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Edad'),
      onSaved: (value) => veterinario.document = int.parse(value),
      validator: (value) {
        if (value.isEmpty) {
          return 'Contraseña es requerido';
        }
        if (value.contains(RegExp('[A-Z]'))) {
          return 'Edad no pude incluir letras A-Z';
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
    //Obtiene todos los veterinarios

    formkey.currentState.save();
    //print(list);
    print("VETERINARIA: ");
    print(veterinario.id);
    print(veterinario.name);
    print(veterinario.lastName);
    print(veterinario.email);
    print(veterinario.document);
    print(veterinario.email);
    print(veterinario.password);
    print(veterinario.phone);
    print(veterinario.age);
    print(veterinario.photo);
    print("     ");

    final result1 =
        vetService.updateUservet(veterinario.id.toString(), veterinario);
  }
}
