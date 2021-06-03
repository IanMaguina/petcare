import 'package:flutter/material.dart';

class CitaDetailedVet extends StatefulWidget {
  @override
  _CitaDetailedVet createState() => new _CitaDetailedVet();
}

class _CitaDetailedVet extends State<CitaDetailedVet> {
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
                  "Ducha antipulgas",
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
                      const Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Hora de inicio :',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: ' Hora ',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                      const Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Hora de fin :',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: ' Hora ',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                      const Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Tipo de cita :',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: ' Ducha anti-pulgas ',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                      const Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Nombre del dueño :',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: ' Juan Perez ',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                      const Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Nombre de la mascota :',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: ' Puking ',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                      const Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Celular :',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: ' 932106464 ',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: MaterialButton(
                      minWidth: 200,
                      height: 30,
                      color: Color.fromRGBO(57, 179, 179, 1.0),
                      textColor: Colors.white,
                      child: Text("Culminar Cita"),
                      onPressed: () {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
