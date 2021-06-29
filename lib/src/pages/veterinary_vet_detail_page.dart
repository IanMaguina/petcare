import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/models/veterinary.dart';
import 'package:petcare/src/pages/edit_Veterinarias.dart';
import 'package:petcare/src/services/vet_service.dart';

class VeterinaryVetDetailPage extends StatelessWidget {
  void runFuture(Future list, APIResponse<Veterinary> veterinary) {
    list.then((value) {
      veterinary = value;
    });
  }

  VeterinaryVetDetailPage(this.id);
  final id;

  VetService vetService = new VetService();

  APIResponse<Veterinary> vetresponse;

  @override
  Widget build(BuildContext context) {
    APIResponse<Veterinary> veterinary;
    Future list = vetService.getVet(id);
    runFuture(list, veterinary);
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
                    veterinary.data.businessname,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    veterinary.data.region,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      veterinary.data.description,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      vetresponse = await vetService.getVet(1);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditVeterinaryPage(vetresponse.data)));
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
                      "Nombres: " + veterinary.data.businessname,
                      style: TextStyle(),
                    ),
                    Text(
                      "Ciudad: " + veterinary.data.region,
                      style: TextStyle(),
                    ),
                    Text(
                      "Email: " + veterinary.data.email,
                      style: TextStyle(),
                    ),
                    Text(
                      "Dirección: " + veterinary.data.address,
                      style: TextStyle(),
                    ),
                    Text(
                      "Descripción: " + veterinary.data.description,
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
