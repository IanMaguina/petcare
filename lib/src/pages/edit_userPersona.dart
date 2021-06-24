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
  UserPersonaService perService = new UserPersonaService();

  UserPersona persona = new UserPersona();
  _EditUserPersonaState(this.persona);
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
      initialValue: persona.name.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre'),
      onSaved: (value) => persona.name = value,
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
      initialValue: persona.lastName.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Apellido'),
      onSaved: (value) => persona.lastName = value,
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
      initialValue: persona.document.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Documento de Identidad'),
      onSaved: (value) => persona.document = int.parse(value),
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
      initialValue: persona.email.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Correo electronico'),
      onSaved: (value) => persona.email = value,
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
      initialValue: persona.password.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Contraseña'),
      onSaved: (value) => persona.password = value,
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
      initialValue: persona.phone.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Telefono Celular'),
      onSaved: (value) => persona.document = int.parse(value),
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
      initialValue: persona.age.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Edad'),
      onSaved: (value) => persona.document = int.parse(value),
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
    //Obtiene todos los personas

    formkey.currentState.save();
    //print(list);
    print("VETERINARIA: ");
    print(persona.id);
    print(persona.name);
    print(persona.lastName);
    print(persona.email);
    print(persona.document);
    print(persona.email);
    print(persona.password);
    print(persona.phone);
    print(persona.age);
    print(persona.photo);
    print("     ");

    final result1 = perService.updateUserper(persona.id.toString(), persona);
  }
}
