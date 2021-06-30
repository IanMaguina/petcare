import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/pet.dart';
import 'package:petcare/src/services/pets_service.dart';

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  DateTime now = DateTime.now();
  DateTime _dateTime = DateTime.now();

 String dropdownValue ='Mascota1'; //valor principal por defecto en el widget de dropdown


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reserva de cita"),
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    "Datos Personales",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Container(
                    height: 150,
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nombres: Juan Diego",
                          style: TextStyle(),
                        ),
                        Text(
                          "Apellidos: Perez Perez",
                          style: TextStyle(),
                        ),
                        Text(
                          "DNI: 12345678",
                          style: TextStyle(),
                        ),
                        Text(
                          "Telefono: 987654321",
                          style: TextStyle(),
                        ),
                        Text(
                          "Email: juanperez@gmail.com",
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Datos del Paciente",
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
                              _dropDownPets(),
                              TextFormField(
                                  decoration: InputDecoration(hintText: "Raza"),
                                  keyboardType: TextInputType.text),
                              TextFormField(
                                  decoration: InputDecoration(hintText: "Sexo"),
                                  keyboardType: TextInputType.number),
                            ],
                          ),
                        ),
                      ),
                    ),
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
                                  decoration:
                                      InputDecoration(hintText: "Horario"),
                                  keyboardType: TextInputType.number),
                              TextFormField(
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
                                      onPressed: () {},
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
        value: dropdownValue,
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
            dropdownValue = newValue;
          });
        },
        items: <String>['Mascota1', 'Mascota2', 'Mascota3']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: Text("Seleccionar una mascota"),
      ),
    );
  }
}
