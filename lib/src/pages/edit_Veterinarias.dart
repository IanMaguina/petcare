import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/Regionemun.dart';
import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/models/region.dart';
import 'package:petcare/src/models/uservet.dart';
import 'package:petcare/src/models/veterinary.dart';
import 'package:petcare/src/pages/user_vet_perfil_page.dart';
import 'package:petcare/src/pages/veterinary_vet_detail_page.dart';
import 'package:petcare/src/services/region_service.dart';
import 'package:petcare/src/services/vet_service.dart';

VetService vetService = new VetService();

class EditVeterinaryPage extends StatefulWidget {
  final Veterinary vet;

  EditVeterinaryPage(this.vet);
  @override
  _EditVeterinaryState createState() => _EditVeterinaryState(vet);
}

class _EditVeterinaryState extends State<EditVeterinaryPage> {
  final Regions re = new Regions();

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
                _editRegion(context),
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
      initialValue: veterinaria.businessname.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre de la Veterinaria'),
      onSaved: (value) => veterinaria.businessname = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'El nombre no puede estar vacio';
        }
        if (value.length < 5) {
          return 'minimo 6 caracteres';
        } else {
          return null;
        }
      },
    );
  }

  Widget _editRegion(BuildContext context) {
    print(re.regions);
    return DropdownButton<String>(
      items: re.regions.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: veterinaria.region.toString(),
      icon: const Icon(Icons.arrow_circle_down_rounded),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onTap: () {},
      onChanged: (String newValue) {
        setState(() {
          veterinaria.region = newValue.toString();
        });
      },
    );
  }

  Widget _editarField() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: veterinaria.field.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Campo'),
      onSaved: (value) => veterinaria.field = value.toString(),
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
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Direccion'),
      onSaved: (value) => veterinaria.address = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Debe ingresar una direccion';
        }
        return null;
      },
    );
  }

  Widget _editarEmail() {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      initialValue: veterinaria.email.toString(),
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
      initialValue: veterinaria.description.toString(),
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
    if (!formkey.currentState.validate() ||
        veterinaria.address == 'Seleccione una Region') {
      return;
    }

    formkey.currentState.save();
    //print(list);
    print("VETERINARIA: ");
    print(veterinaria.id);
    print(veterinaria.businessname);
    print(veterinaria.email);
    print(veterinaria.address);
    print(veterinaria.description);
    print(veterinaria.field);
    print(veterinaria.region);
    print("     ");

    final result1 =
        vetService.updateVet(veterinaria.id.toString(), veterinaria);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => UserVetInfoPage(), //Id Del login
    ));
  }
}
