import 'package:flutter/material.dart';
import 'package:petcare/src/models/pet.dart';

class PetDetailPage extends StatelessWidget {
  Pet mascota;
  PetDetailPage(this.mascota);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle Mascota"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/pet1.jpg'))),
            ),
            /*  Container(
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
            ), */
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                height: 150,
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Información General",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Nombres: ${mascota.name}",
                      style: TextStyle(),
                    ),
                    Text(
                      "Raza: ${mascota.breed}",
                      style: TextStyle(),
                    ),
                    Text(
                      "Edad: ${mascota.age} años",
                      style: TextStyle(),
                    ),
                    Text(
                      "Género: ${mascota.sex}",
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: MaterialButton(
                    minWidth: 200,
                    height: 30,
                    color: Color.fromRGBO(57, 179, 179, 1.0),
                    textColor: Colors.white,
                    child: Text("Editar"),
                    onPressed: () {
                      /* Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => editar(),
                    )); */
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: MaterialButton(
                    minWidth: 200,
                    height: 30,
                    color: Colors.grey,
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
