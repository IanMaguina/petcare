import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petcare/src/models/pet.dart';
import 'package:petcare/src/pages/edit_pet_page.dart';
import 'package:petcare/src/pages/pet_detail_page.dart';
import 'package:petcare/src/services/pets_service.dart';
import 'package:petcare/src/pages/add_pet_page.dart';
import 'package:petcare/src/widgets/lista_pets.dart';
import 'package:provider/provider.dart';

class ListPetPage extends StatefulWidget {
  @override
  _ListPetPageState createState() => _ListPetPageState();
}

class _ListPetPageState extends State<ListPetPage> {
  PetsService petService = new PetsService();

  //Pet pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: FutureBuilder(
          future: petService.getPetByCustomerId(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final List<Pet> listamasc = snapshot.data.data;
              return _ListaMascotas(listamasc);
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(57, 179, 179, 1.0),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddPetPage(),
          ));
        },
        child: Icon(Icons.add_box),
      ),
    );
  }
}

class _ListaMascotas extends StatefulWidget {
  final List<Pet> mascotas;
  const _ListaMascotas(this.mascotas);

  @override
  __ListaMascotasState createState() => __ListaMascotasState();
}

class __ListaMascotasState extends State<_ListaMascotas> {
  PetsService petService2 = new PetsService();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.mascotas.length,
      itemBuilder: (BuildContext context, int index) {
        final service = widget.mascotas[index];
        return Dismissible(
          key: Key(widget.mascotas[index].name),
          onDismissed: (DismissDirection direction) async {
            final info = await petService2.deletePet(widget.mascotas[index]);

            if (!info.error) {
              setState(() {
                widget.mascotas.removeAt(index);
                Fluttertoast.showToast(msg: "Mascota Eliminada");
              });
            } else {
              Fluttertoast.showToast(msg: info.errorMessage);
            }
          },
          background: Container(
            child: Icon(Icons.delete),
            color: Colors.red[900],
          ),
          child: _element(context, service),
        );
      },
    );
  }
}

Widget _element(BuildContext context, Pet mascota) {
  return ListTile(
    contentPadding: EdgeInsets.all(12),
    leading: CircleAvatar(
      backgroundImage: AssetImage('assets/images/pet1.jpg'),
      radius: 30,
    ),
    title: Text(mascota.name),
    subtitle: Text(mascota.age),
    trailing: IconButton(
      icon: Icon(
        Icons.edit,
        color: Color.fromRGBO(57, 179, 179, 1),
      ),
      onPressed: () {
        //por si acaso
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EditPetPage(mascota),
        ));
      },
    ),
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PetDetailPage(mascota),
      ));
    },
  );
}
