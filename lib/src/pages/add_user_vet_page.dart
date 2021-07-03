import 'package:flutter/material.dart';
import 'package:petcare/src/models/uservet.dart';

import 'add_veterinary.dart';

class Add_Vet extends StatefulWidget {
  @override
  _Add_VetState createState() => _Add_VetState();
}

class _Add_VetState extends State<Add_Vet> {
  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // UservService uvService =new UservService();
  Uservet uservet = new Uservet();

  // final usuarioProvider = new UserService();

  @override
  Widget build(BuildContext context) {
    uservet.id = 0;
    uservet.owner = true;
    uservet.photo = "VACIO";

    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Veterinario'),
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
                _crearApellido(),
                _crearDNI(),
                _crearEmail(),
                _crearPwd(),
                _crearTelefono(),
                _crearEdad(),
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
      initialValue: uservet.name,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre de Usuario'),
      onSaved: (value) => uservet.name = value,
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

  Widget _crearApellido() {
    return TextFormField(
      initialValue: uservet.lastName,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Apellido de Usuario'),
      onSaved: (value) => uservet.lastName = value,
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

  Widget _crearTelefono() {
    return TextFormField(
      //    initialValue: uservet.phone.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'telefono'),
      onSaved: (value) => uservet.phone = int.parse(value),
      validator: (value) {
        if (value.isEmpty) {
          return 'Contraseña es requerido';
        }
        if (value.length != 9) {
          return 'La cantidad de digitos no puede ser distinta de 9';
        }
        if (value.contains(RegExp('[A-Z]'))) {
          return 'Telefono NO pude incluir letras A-Z';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearEdad() {
    return TextFormField(
      //     initialValue: uservet.age.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Edad'),
      onSaved: (value) => uservet.age = int.parse(value),
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

  Widget _crearDNI() {
    return TextFormField(
      //  initialValue: uservet.document.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'DNI'),
      onSaved: (value) => uservet.document = int.parse(value),
      validator: (value) {
        if (value.isEmpty) {
          return 'Documento es requerido';
        }
        if (value.length != 8) {
          return 'DNI Invalido';
        }
        if (value.contains(RegExp('[A-Z]'))) {
          return 'DNI NO pude incluir letras A-Z';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearEmail() {
    return TextFormField(
      initialValue: uservet.email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(labelText: 'email'),
      onSaved: (value) => uservet.email = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'El correo electronico no puede estar vacio';
        }
        if (!value.contains('@')) {
          return 'Correo electronico invalido';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearPwd() {
    return TextFormField(
      initialValue: uservet.password,
      // keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(labelText: 'Contraseña'),
      onSaved: (value) => uservet.password = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Debe ingresar una contraseña';
        }
        if (value.length < 8) {
          return 'Mínimo 8 caracteres para la contraseña';
        } else {
          return null;
        }
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
      onPressed: () async {
        final data = uservet;

        print('Posting data...');

        _submit(context);
      },
    );
  }

  void _submit(BuildContext context) async {
    if (!formkey.currentState.validate()) {
      return;
    }
    formkey.currentState.save();
    final data = uservet;
    //final result =await uvService.createUserv(uservet);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Add_Veterinary(data: data),
      ),
    );
  }
}
// Map info = await usuarioProvider.nuevoUsuario(usuario);

// print('todo ok');
// print(usuario.usuario);

/*  if (info['ok']) {
      utils.mostrarAlerta(context,
          'Se ha registrado correctamente, se ha enviado un código de activación a su correo. loguése nuevamente.');
      //Navigator.pushReplacementNamed(context, '/');
    } else {
      utils.mostrarAlerta(context, info['mensaje']);
    } */

/*
import 'package:flutter/material.dart';
import 'package:petcare/src/models/uservet.dart';
import 'package:petcare/src/services/user_vet_service.dart';
import 'add_veterinary.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/services/vet_service.dart';
import 'package:petcare/src/utils/utils.dart' as utils;

class Add_Vet extends StatefulWidget {
  @override
  _Add_VetState createState() => _Add_VetState();
}
class _Add_VetState extends State<Add_Vet> {
  final formkey = GlobalKey<FormState>();
  Uservet userV = new Uservet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Registrar Veterinario',
        style: TextStyle(color: Colors.white),
      )),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildLastName(),
                _buildDocument(),
                _buildEmail(),
                _buildPassword(),
                _buildPhone(),
                _buildAge(),
                _buildButton(context),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
      label: Text('Registrar'),
      icon: Icon(Icons.save),
      onPressed: () {
        _submit(context);
        print('Posting data...');

        postData(userV);

  //      Navigator.of(context).push(MaterialPageRoute(
 //         builder: (context) => Add_Veterinary(),
 //       ));
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

*/
