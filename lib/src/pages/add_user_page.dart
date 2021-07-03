import 'package:flutter/material.dart';
import 'package:petcare/src/models/user.dart';
import 'package:petcare/src/providers/usuario_provider.dart';
import 'package:petcare/src/services/user_persona_service.dart';
import 'package:petcare/src/utils/utils.dart' as utils;

class AddUserPage extends StatefulWidget {
  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  User usuario = new User();
  //final usuarioProvider = new UsuarioProvider();
  final usuarioProvider = new UserPersonaService();

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
      initialValue: "",
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre de Usuario'),
      onSaved: (value) => usuario.name = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Nombre es requerido';
        }
        return null;
      },
    );
  }

  Widget _crearApellido() {
    return TextFormField(
      initialValue: "",
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Apellido de Usuario'),
      onSaved: (value) => usuario.lastName = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Apellido es requerido';
        }
        return null;
      },
    );
  }

  Widget _crearTelefono() {
    return TextFormField(
      initialValue: "",
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'telefono'),
      onSaved: (value) => usuario.phone = int.parse(value),
      validator: (value) {
        if (value.isEmpty) {
          return 'Telefono es requerido';
        }
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Solo numeros';
        }
      },
    );
  }

  Widget _crearEdad() {
    return TextFormField(
      initialValue: "",
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Edad'),
      onSaved: (value) => usuario.age = int.parse(value),
      validator: (value) {
        if (value.isEmpty) {
          return 'Edad es requerida';
        }
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Solo numeros';
        }
      },
    );
  }

  Widget _crearDNI() {
    return TextFormField(
      initialValue: "",
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'DNI'),
      onSaved: (value) => usuario.document = int.parse(value),
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
      initialValue: "",
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(labelText: 'email'),
      onSaved: (value) => usuario.email = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Email es requerido';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearPwd() {
    return TextFormField(
      initialValue: "",
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
      onPressed: () {
        _submit(context);
      },
    );
  }

  void _submit(BuildContext context) async {
    if (!formkey.currentState.validate()) {
      return;
    }
    usuario.id = 0;
    usuario.photo = "VACIO";

    formkey.currentState.save();

    print(usuario);

    final info = await usuarioProvider.nuevoUsuario(usuario);

    /* if (info['ok']) {
      utils.mostrarAlerta(context, "Se ha registrado correctamente al usuario"); */
    Navigator.pop(context);
    /*  } else {
      utils.mostrarAlerta(context, info['mensaje']);
    } */
  }
}
