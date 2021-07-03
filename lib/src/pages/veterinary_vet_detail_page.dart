import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/models/veterinary.dart';
import 'package:petcare/src/pages/edit_Veterinarias.dart';
import 'package:petcare/src/services/vet_service.dart';

class VeterinaryVetDetailPage extends StatelessWidget {
  VeterinaryVetDetailPage(this.id);
  final id;

  VetService vetService = new VetService();

  APIResponse<Veterinary> vetresponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle Veterinaria"),
      ),
      body: SafeArea(
        top: true,
        child: FutureBuilder(
          future: vetService.getVet(id),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final Veterinary listamasc = snapshot.data.data;
              return _detalle(listamasc, vetresponse, context);
            }
          },
        ),
      ),
    );
  }
}

_detalle(Veterinary veterinary, APIResponse<Veterinary> vetresponse,
    BuildContext context) {
  return Padding(
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
                veterinary.businessname,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                veterinary.region,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  veterinary.description,
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
                  "Nombres: " + veterinary.businessname,
                  style: TextStyle(),
                ),
                Text(
                  "Ciudad: " + veterinary.region,
                  style: TextStyle(),
                ),
                Text(
                  "Email: " + veterinary.email,
                  style: TextStyle(),
                ),
                Text(
                  "Dirección: " + veterinary.address,
                  style: TextStyle(),
                ),
                Text(
                  "Descripción: " + veterinary.description,
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
  );
}
