import 'package:flutter/material.dart';
import 'package:petcare/src/models/appointment.dart';

class CitaDetailedVet extends StatefulWidget {
  final Appointment cita;
  CitaDetailedVet(this.cita);
  @override
  _CitaDetailedVet createState() => new _CitaDetailedVet(cita);
}

class _CitaDetailedVet extends State<CitaDetailedVet> {
  Appointment cita;
  _CitaDetailedVet(this.cita);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  cita.productName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  height: 200,
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Hora de inicio :',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: cita.startTime,
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Hora de fin :',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: cita.endTime,
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Tipo de cita :',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: cita.productTypeName,
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Nombre del dueño :',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: cita.personName,
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Nombre de la mascota :',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: cita.petName,
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.only(top: 8),
              //       child: MaterialButton(
              //         minWidth: 100,
              //         height: 30,
              //         color: Colors.red,
              //         textColor: Colors.white,
              //         child: Text("Culminar Cita"),
              //         onPressed: () {
              //           Navigator.pop(context);
              //         },
              //       ),
              //     ),
              //     Padding(
              //       padding: EdgeInsets.only(top: 8),
              //       child: MaterialButton(
              //         minWidth: 100,
              //         height: 30,
              //         color: Color.fromRGBO(57, 179, 179, 1.0),
              //         textColor: Colors.white,
              //         child: Text("ver Paciente"),
              //         onPressed: () {
              //           Navigator.pushNamed(context, 'vetpetdetail');
              //         },
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
