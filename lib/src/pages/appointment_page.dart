import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/models/appointment.dart';
import 'package:petcare/src/models/pet.dart';
import 'package:petcare/src/models/service_.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';
import 'package:petcare/src/services/date_service.dart';
import 'package:petcare/src/services/pets_service.dart';

class AppointmentPage extends StatefulWidget {
  final idVeterinaria;
  AppointmentPage(this.idVeterinaria);
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  DateTime now = DateTime.now();
  DateTime _dateTime = DateTime.now();

  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _prefs = new PreferenciasUsuario();
  Appointment date = new Appointment();
  final dateService = new DateService();
  Service service = new Service();
  Pet pet = new Pet();
  /* APIResponse<List<Pet>> listapets; */
  String mypet;
  PetsService petService = new PetsService();
  List<Pet> listapets = [];
  String dropdownValue =
      'Mascota1'; //valor principal por defecto en el widget de dropdown
/* 
  @override
  void initState() async {
    super.initState();
    this.listapets = await petService.getPetByCustomerId();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reserva de cita"),
      ),
      body: ListView(
        children: [
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mascota",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    /*   _dropDownPets() */
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Agendar Cita",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              datePicker(),
                              TextFormField(
                                  initialValue: date.starttime,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  onSaved: (value) => date.starttime = value,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Insertar horario';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration:
                                      InputDecoration(hintText: "Horario"),
                                  keyboardType: TextInputType.number),
                              TextFormField(
                                  initialValue: service.name,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  onSaved: (value) => service.name = value,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Insertar servicio';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration:
                                      InputDecoration(hintText: "Servicio"),
                                  keyboardType: TextInputType.text),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 16),
                                    child: MaterialButton(
                                      minWidth: 100,
                                      height: 30,
                                      padding: EdgeInsets.all(10),
                                      color: Color.fromRGBO(57, 179, 179, 1.0),
                                      textColor: Colors.white,
                                      child: Text("Reservar Cita"),
                                      onPressed: () {
                                        _reservarcita(context);
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 16),
                                    child: MaterialButton(
                                      minWidth: 100,
                                      height: 30,
                                      padding: EdgeInsets.all(10),
                                      color: Colors.red,
                                      textColor: Colors.white,
                                      child: Text("Cancelar"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget datePicker() {
    return Row(
      children: [
        Container(
          height: 30,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.black38,
          ))),
          child: Text(
            _dateTime == null ? 'Colocar fecha ' : _dateTime.toString(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: ElevatedButton(
            child: Text("Fecha"),
            onPressed: () {
              showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2022))
                  .then((date) {
                setState(() {
                  _dateTime = date;
                });
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _dropDownPets() {
    return Container(
      width: 190,
      child: DropdownButton<String>(
        value: mypet,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.black38),
        underline: Container(
          height: 1,
          color: Colors.black38,
        ),
        onChanged: (String newValue) {
          setState(() {
            mypet = newValue;
          });
        },
        items: this.listapets?.map((item) {
              return new DropdownMenuItem(
                  child: new Text(item.name), value: item.id);
            })?.toList() ??
            [],
        hint: Text("Seleccionar una mascota"),
      ),
    );
  }

  void _reservarcita(BuildContext context) {
    if (!formkey.currentState.validate()) {
      return;
    }
    formkey.currentState.save();
    final idUsuario = _prefs.iduser;
    /*Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Appointment(date.datereservation)
    ));*/
  }
}
