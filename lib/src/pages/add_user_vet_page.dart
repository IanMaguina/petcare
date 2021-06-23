import 'package:flutter/material.dart';
import 'add_veterinary.dart';
import 'package:petcare/src/utils/utils.dart' as utils;

class AddUserVetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name;
    String lastname;
    String document;
    String email;
    String password;
    String phone;
    String age;

    Widget _buildName() {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Nombre'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Nombre es requerido';
          }
          if (value.length < 6) {
            return 'minimo 6 caracteres';
          } else {
            return null;
          }
        },
        onSaved: (String value) {
          name = value;
        },
      );
    }

    Widget _buildLastName() {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Apellido'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Apellido requerido';
          }
          if (value.length < 6) {
            return 'minimo 6 caracteres';
          } else {
            return null;
          }
        },
        onSaved: (String value) {
          lastname = value;
        },
      );
    }

    Widget _buildDocument() {
      return TextFormField(
        decoration: InputDecoration(labelText: 'DNI'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'DNI es requerido';
          }
          if (value.length < 8) {
            return 'Ingrese numero valido';
          }
          if (utils.isNumeric(value)) {
            return null;
          } else {
            return 'Solo numeros';
          }
        },
        onSaved: (String value) {
          document = value;
        },
      );
    }

    Widget _buildEmail() {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Email'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Email es requerido';
          }
          return null;
        },
        onSaved: (String value) {
          email = value;
        },
      );
    }

    Widget _buildPassword() {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Contraseña'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Contraseña es requerido';
          }
          if (value.length < 6) {
            return 'debe tener 6 caracteres como minimo';
          } else {
            return null;
          }
        },
        onSaved: (String value) {
          password = value;
        },
      );
    }

    Widget _buildPhone() {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Telefono'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Telefono es requerido';
          }
          if (utils.isNumeric(value)) {
            return null;
          } else {
            return 'Solo numeros';
          }
        },
        onSaved: (String value) {
          phone = value;
        },
      );
    }

    Widget _buildAge() {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Edad'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Edad es requerida';
          }
          if (utils.isNumeric(value)) {
            return null;
          } else {
            return 'Solo numeros';
          }
        },
        onSaved: (String value) {
          phone = value;
        },
      );
    }

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
                SizedBox(height: 100),
                ElevatedButton.icon(
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
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Add_Veterinary(),
                    ));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
