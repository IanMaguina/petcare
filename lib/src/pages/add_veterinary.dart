import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/Regionemun.dart';
import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/models/region.dart';
import 'package:petcare/src/models/uservet.dart';
import 'package:petcare/src/models/veterinary.dart';
import 'package:petcare/src/services/region_service.dart';
import 'package:petcare/src/services/user_vet_service.dart';
import 'package:petcare/src/services/uservet_service.dart';
import 'package:petcare/src/services/vet_service.dart';
import 'package:petcare/src/widgets/login_uservet_widget.dart';

import 'login_page.dart';

class Add_Veterinary extends StatefulWidget {
  final Uservet data;
  Add_Veterinary({this.data});
  @override
  _Add_VeterinaryState createState() => _Add_VeterinaryState(data: data);
}

class _Add_VeterinaryState extends State<Add_Veterinary> {
  @override
  final Uservet data;
  _Add_VeterinaryState({this.data});
  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  //para guardar el veterinario
  UservService uvService = new UservService();

  //para editar la veterinaria guardada que fue creada al crear veterinario
  VetService vetService = new VetService();

  //Para el combo box de region
  RegionService regionService = new RegionService();
  final listreg = <String>[];

  Veterinary vet = new Veterinary();

  UservService get service => GetIt.I<UservService>();
  VetService get service2 => GetIt.I<VetService>();
  RegionService get service3 => GetIt.I<RegionService>();
  APIResponse<List<Region>> _apiResponse3;
  APIResponse<List<Uservet>> _apiResponse;
  APIResponse<List<Veterinary>> _apiResponse2;

  bool _isLoading = false;

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
  // final usuarioProvider = new UserService();

  @override
  Widget build(BuildContext context) {
    vet.id = 0;
    Widget _buildBusinessName() {
      return TextFormField(
        initialValue: vet.businessname,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(labelText: 'Nombre de Veterinaria'),
        onSaved: (value) => vet.businessname = value,
        validator: (value) {
          if (value.isEmpty) {
            return 'Nombre de veterinaria es requerido';
          }
          if (value.length < 3) {
            return 'minimo 6 caracteres';
          } else {
            return null;
          }
        },
      );
    }

    Widget _buildRegion(BuildContext context) {
      Regions re = new Regions();
      print(re.regions[0]);
      var vista = 'Seleccione una Region';
      //  vet.region = 'Seleccione una Region';

      return DropdownButton<String>(
        hint: Text(vista),
        value: vet.region,
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
            vista = newValue;
            vet.region = newValue.toString();
          });
        },
        // items:listreg.map<DropdownMenuItem<String>>((String value)
        items: re.regions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    }

    ;

    Widget _buildEmail() {
      return TextFormField(
        initialValue: vet.email,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(labelText: 'Email'),
        onSaved: (value) => vet.email = value,
        validator: (value) {
          if (value.isEmpty) {
            return 'Email es requerido';
          } else {
            return null;
          }
        },
      );
    }

    Widget _buildField() {
      return TextFormField(
        initialValue: vet.field,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(labelText: 'Campo'),
        onSaved: (value) => vet.field = value,
        validator: (value) {
          if (value.isEmpty) {
            return 'Campo es requerido';
          }
          if (value.length < 6) {
            return 'minimo 6 caracteres';
          } else {
            return null;
          }
        },
      );
    }

    Widget _buildAddress() {
      return TextFormField(
        initialValue: vet.address,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(labelText: 'Direccion'),
        onSaved: (value) => vet.address = value,
        validator: (value) {
          if (value.isEmpty) {
            return 'Direccion es requerido';
          }
          if (value.length < 6) {
            return 'minimo 6 caracteres';
          } else {
            return null;
          }
        },
      );
    }

    Widget _buildDescription() {
      return TextFormField(
        initialValue: vet.description,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(labelText: 'Descripcion'),
        onSaved: (value) => vet.description = value,
        validator: (value) {
          if (value.isEmpty) {
            return 'Descripcion es requerido';
          }
          if (value.length < 6) {
            return 'minimo 6 caracteres';
          } else {
            return null;
          }
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Veterinaria'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(50),
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                _buildBusinessName(),
                _buildRegion(context),
                _buildField(),
                _buildEmail(),
                _buildAddress(),
                _buildDescription(),
                _crearBoton(context),
              ],
            ),
          ),
        ),
      ),
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
        print('Posting data...');

        //PostData(uservet);
        _submit(context);
      },
    );
  }

  void _submit(BuildContext context) async {
    if (!formkey.currentState.validate() ||
        vet.address == 'Seleccione una Region') {
      return;
    }
    //crea veterinario
    final result = await uvService.createUserv(data);
    //Obtiene todos los veterinarios
    _apiResponse = await service.getUservetsList();

    var last = _apiResponse.data.length;

    formkey.currentState.save();
    //print(list);
    print("VETERINARIA: ");
    print(vet.id);
    print(vet.businessname);
    print(vet.email);
    print(vet.address);
    print(vet.description);
    print(vet.field);
    print(vet.region);
    print("     ");

    final result1 = vetService.updateVet(last.toString(), vet);
  }
}
