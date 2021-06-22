import 'package:flutter/material.dart';

class PetDetailVetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle Mascota"),
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
                      image: AssetImage('assets/images/pet1.jpg'))),
            ),
            Container(
              width: 170,
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Perro 1",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "2 años",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
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
                height: 150,
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nombres: Perro 1",
                      style: TextStyle(),
                    ),
                    Text(
                      "Raza: Bulldog",
                      style: TextStyle(),
                    ),
                    Text(
                      "Edad: 2 años",
                      style: TextStyle(),
                    ),
                    Text(
                      "Género: macho",
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
                    child: Text("Regresar"),
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
    );
  }
}
