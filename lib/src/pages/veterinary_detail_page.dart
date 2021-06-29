import 'package:flutter/material.dart';
import 'package:petcare/src/models/veterinary.dart';
import 'package:petcare/src/pages/appointment_page.dart';

class VeterinaryDetailPage extends StatelessWidget {
  final Veterinary veterinaria;

  VeterinaryDetailPage(this.veterinaria);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detalle Veterinaria",
          style: TextStyle(color: Colors.white),
        ),
        actionsIconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          children: [
            Container(
              width: 100,
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/veterinary1.jpg'))),
            ),
            Container(
              width: 170,
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    veterinaria.businessname,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    veterinaria.address,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      veterinaria.description,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "Información General",
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
                    Text(
                      "Nombres: ${veterinaria.businessname} ",
                      style: TextStyle(),
                    ),
                    Text(
                      "Ciudad: ${veterinaria.region}",
                      style: TextStyle(),
                    ),
                    /* Text(
                      "Telefono: ${veterinaria.}",
                      style: TextStyle(),
                    ), */
                    Text(
                      "Email: ${veterinaria.email}",
                      style: TextStyle(),
                    ),
                    Text(
                      "Dirección: ${veterinaria.address}",
                      style: TextStyle(),
                    ),
                    /* Text(
                      "Celular: ${veterinaria.phone}",
                      style: TextStyle(),
                    ), */
                    Text(
                      "Descripción: ${veterinaria.description}",
                      style: TextStyle(),
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
                    child: Text("Reservar Cita"),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AppointmentPage(),
                      ));
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
