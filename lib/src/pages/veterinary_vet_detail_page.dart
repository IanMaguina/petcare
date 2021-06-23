import 'package:flutter/material.dart';
import 'package:petcare/src/models/veterinary.dart';
import 'package:petcare/src/pages/edit_Veterinarias.dart';

class VeterinaryVetDetailPage extends StatelessWidget {
  //Veterinary vet;
  Veterinary vet = Veterinary.fromJson({
    'id': 1,
    'address': 'asdasd',
    'businessName': 'asdasdas',
    'email ': 'asdasda@dasd',
    'description ': 'dasdasdasdas',
    'region ': 'asdasdasdas',
    'field ': 'dasdasdasd',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle Veterinaria"),
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
                    "Vet Pet",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Lima, Peru",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Especial cuidado a tus mascotas",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditVeterinaryPage(vet)));
                    },
                    icon: Icon(Icons.edit),
                    label: Text('Editar'),
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
                      "Nombres: Vet Pet",
                      style: TextStyle(),
                    ),
                    Text(
                      "Ciudad: Lima",
                      style: TextStyle(),
                    ),
                    Text(
                      "Telefono: 555-1234",
                      style: TextStyle(),
                    ),
                    Text(
                      "Email: vetpet@gmail.com",
                      style: TextStyle(),
                    ),
                    Text(
                      "Dirección: Av. Luis 515",
                      style: TextStyle(),
                    ),
                    Text(
                      "Celular: 987654321",
                      style: TextStyle(),
                    ),
                    Text(
                      "Descripción: Somos una veterinaria que "
                      "le brindará un cuidado especial a tu mascota.",
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
