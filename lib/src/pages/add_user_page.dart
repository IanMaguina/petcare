import 'package:flutter/material.dart';
import 'package:petcare/src/models/user.dart';
import 'package:petcare/src/utils/utils.dart' as utils;
//import 'package:facturas/src/providers/usuario_provider.dart';

class AddUserPage extends StatefulWidget {
  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  User usuario = new User();
  // final usuarioProvider = new UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuarios'),
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
      initialValue: usuario.name,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre de Usuario'),
      onSaved: (value) => usuario.name = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Contraseña es requerido';
        }if (value.length < 3) {
          return 'minimo 6 caracteres';
        }
        else {
          return null;
        }
      },
    );
  }

  Widget _crearApellido() {
    return TextFormField(
      initialValue: usuario.lastName,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Apellido de Usuario'),
      onSaved: (value) => usuario.lastName = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Contraseña es requerido';
        }if (value.length < 6) {
          return 'minimo 6 caracteres';
        }
         else {
          return null;
        }
      },
    );
  }

  Widget _crearTelefono() {
    return TextFormField(
      initialValue: usuario.phone.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'telefono'),
      onSaved: (value) => usuario.phone = value as int,
      validator: (value) {
        if (value.isEmpty) {
          return 'Contraseña es requerido';
        }if (utils.isNumeric(value)) {
          return null;
        }
        else {
          return 'Solo numeros';
        }
      },
    );
  }

  Widget _crearEdad() {
    return TextFormField(
      initialValue: usuario.age.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Edad'),
      onSaved: (value) => usuario.age = value as int,
      validator: (value) {
        if (value.isEmpty) {
          return 'Contraseña es requerido';
        }if (utils.isNumeric(value)) {
          return null;
        }
         else {
          return 'Solo numeros';
        }
      },
    );
  }

  Widget _crearDNI() {
    return TextFormField(
      initialValue: usuario.document.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'DNI'),
      onSaved: (value) => usuario.document = value as int,
      validator: (value) {
        if (value.isEmpty) {
        return 'DNI es requerido';
         }
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Solo numeros';
        }
      },
    );
  }

  Widget _crearEmail() {
    return TextFormField(
      initialValue: usuario.email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(labelText: 'email'),
      onSaved: (value) => usuario.email = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Contraseña es requerido';
        }else {
          return null;
        }
      },
    );
  }

  Widget _crearPwd() {
    return TextFormField(
      initialValue: usuario.password,
      // keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(labelText: 'Contraseña'),
      onSaved: (value) => usuario.password = value,
      validator: (value) {
        if (value.isEmpty) {
        return 'Contraseña es requerido';
      }
        if (value.length < 6) {
          return 'debe tener 6 caracteres como minimo';
        }
       else {
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
  }
}
