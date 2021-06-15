import 'package:flutter/material.dart';
import 'package:petcare/src/models/userperson.dart';

class EditUserPersonaPage extends StatefulWidget {
  final UserPersona vet;
  EditUserPersonaPage(this.vet);
  @override
  _EditUserPersonaState createState() => _EditUserPersonaState(vet);
}

class _EditUserPersonaState extends State<EditUserPersonaPage> {
  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  UserPersona veterinario = new UserPersona();
  _EditUserPersonaState(this.veterinario);
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
      initialValue: veterinario.name,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre'),
      onSaved: (value) => veterinario.name = value,
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
      initialValue: veterinario.lastName,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Apellido'),
      onSaved: (value) => veterinario.lastName = value,
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
      initialValue: veterinario.document.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Documento de Identidad'),
      onSaved: (value) => veterinario.document = int.parse(value),
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
      initialValue: veterinario.email,
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
      initialValue: veterinario.password,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Contraseña'),
      onSaved: (value) => veterinario.password = value,
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
      initialValue: veterinario.phone.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Telefono Celular'),
      onSaved: (value) => veterinario.document = int.parse(value),
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
      initialValue: veterinario.age.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Edad'),
      onSaved: (value) => veterinario.document = int.parse(value),
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
      initialValue: veterinario.photo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Link de Foto'),
      onSaved: (value) => veterinario.photo = value,
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
    if (!formkey.currentState.validate()) {
      return;
    }
    formkey.currentState.save();
  }
}
