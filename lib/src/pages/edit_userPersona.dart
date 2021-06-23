import 'package:flutter/material.dart';
import 'package:petcare/src/models/userperson.dart';
import 'package:petcare/src/services/user_persona_service.dart';

class EditUserPersonaPage extends StatefulWidget {
  final UserPersona vet;
  EditUserPersonaPage(this.vet);
  @override
  _EditUserPersonaState createState() => _EditUserPersonaState(vet);
}

class _EditUserPersonaState extends State<EditUserPersonaPage> {
  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  UserPersonaService vetService = new UserPersonaService();

  UserPersona perdona = new UserPersona();
  _EditUserPersonaState(this.perdona);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar datos del usuario'),
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
                _editarPhoto(),
                SizedBox(height: 30),
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
      initialValue: perdona.name,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre'),
      onSaved: (value) => perdona.name = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'El nombre no puede estar vacio';
        }
        if (value.length < 3) {
          return 'minimo 6 caracteres';
        } else {
          return null;
        }
      },
    );
  }

  Widget _editarLastName() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: perdona.lastName,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Apellido'),
      onSaved: (value) => perdona.lastName = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'La region no puede estar en blanco';
        } else {
          return null;
        }
      },
    );
  }

  Widget _editarDocument() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: perdona.document.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Documento de Identidad'),
      onSaved: (value) => perdona.document = int.parse(value),
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

  Widget _editarEmail() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: perdona.email,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Correo electronico'),
      onSaved: (value) => perdona.email = value,
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
      initialValue: perdona.password,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Contraseña'),
      onSaved: (value) => perdona.password = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Debe ingresar una Edad';
        }
        return null;
      },
    );
  }

  Widget _editarPhone() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: perdona.phone.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Telefono Celular'),
      onSaved: (value) => perdona.document = int.parse(value),
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

  Widget _editarAge() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: perdona.age.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Edad'),
      onSaved: (value) => perdona.document = int.parse(value),
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

  Widget _editarPhoto() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: perdona.photo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Link de Foto'),
      onSaved: (value) => perdona.photo = value,
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
    //Obtiene todos los perdonas

    formkey.currentState.save();
    //print(list);
    print("VETERINARIA: ");
    print(perdona.id);
    print(perdona.name);
    print(perdona.lastName);
    print(perdona.email);
    print(perdona.document);
    print(perdona.email);
    print(perdona.password);
    print(perdona.phone);
    print(perdona.age);
    print(perdona.photo);
    print("     ");

    final result1 = vetService.updateUservet(
        perdona.id.toString(), perdona, perdona.idUsuario.toString());
  }
}
