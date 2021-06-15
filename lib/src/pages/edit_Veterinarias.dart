import 'package:flutter/material.dart';
import 'package:petcare/src/models/veterinary.dart';

class EditVeterinaryPage extends StatefulWidget {
  final Veterinary vet;
  EditVeterinaryPage(this.vet);
  @override
  _EditVeterinaryState createState() => _EditVeterinaryState(vet);
}

class _EditVeterinaryState extends State<EditVeterinaryPage> {
  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Veterinary veterinaria = new Veterinary();
  _EditVeterinaryState(this.veterinaria);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar datos de Veterinaria'),
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
                _editarRegion(),
                SizedBox(height: 10),
                _editarField(),
                SizedBox(height: 10),
                _editarDireccion(),
                SizedBox(height: 10),
                _editarEmail(),
                SizedBox(height: 10),
                _editarDescripcion(),
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
      initialValue: veterinaria.businessName,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre de la Veterinaria'),
      onSaved: (value) => veterinaria.businessName = value,
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

  Widget _editarRegion() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: veterinaria.region,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Region de la veterinaria'),
      onSaved: (value) => veterinaria.region = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'La region no puede estar en blanco';
        } else {
          return null;
        }
      },
    );
  }

  Widget _editarField() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: veterinaria.field,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Campo'),
      onSaved: (value) => veterinaria.field = value,
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

  Widget _editarDireccion() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: veterinaria.address.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Direccion'),
      onSaved: (value) => veterinaria.address = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Debe ingresar una Edad';
        }
        return null;
      },
    );
  }

  Widget _editarEmail() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: veterinaria.email,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Correo electronico'),
      onSaved: (value) => veterinaria.email = value,
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

  Widget _editarDescripcion() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: veterinaria.description,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Descripcion de la empresa'),
      onSaved: (value) => veterinaria.description = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'La descripcion no este vacio';
        }
        if (value.length > 10000) {
          return 'Limite de caracteres alcanzado';
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
