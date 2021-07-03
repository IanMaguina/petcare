import 'package:flutter/material.dart';
import 'package:petcare/src/models/pet.dart';
import 'package:petcare/src/pages/edit_pet_page.dart';
import 'package:petcare/src/pages/pet_detail_page.dart';
import 'package:petcare/src/services/pets_service.dart';
import 'package:petcare/src/pages/add_pet_page.dart';
import 'package:petcare/src/widgets/lista_pets.dart';

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

/*class _ListaMascotas extends StatelessWidget {
  final List<Pet> mascotas;
  const _ListaMascotas(this.mascotas);


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mascotas.length,
      itemBuilder: (BuildContext context, int index) {
        final service = mascotas[index];
        return _element(context, service);
      },
    );
  }
}

Widget _element(BuildContext context, Pet mascota) {
  return ListTile(
    contentPadding: EdgeInsets.all(12),
    leading:
        CircleAvatar(
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

Widget _element(BuildContext context, Pet mascota){
  List<Pet> listPet;
  PetsService petService;
  return ListView.builder(
      itemCount: listPet.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
            key: Key(listPet[index].name),

            onDismissed: (DismissDirection direction) {
            setState((){

            });
              petService.deletePet(mascota);
              

              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("mascota $mascota eliminada")));
            },
            child: ListTile(
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
            ));
      });
}
*/

class _ListaMascotas extends StatefulWidget {
  final List<Pet> mascotas;
  const _ListaMascotas(this.mascotas);

  @override
  __ListaMascotasState createState() => __ListaMascotasState();
}

class __ListaMascotasState extends State<_ListaMascotas> {
  // ignore: deprecated_member_use
  final List<Pet> mascotas = new List<Pet>();
  Pet mascota;
  @override
  Widget build(BuildContext context) {
    List<Pet> listPet;
    PetsService petService;
    return ListView.builder(
      itemCount: mascotas.length,
      itemBuilder: (BuildContext context, int index) {
        final service = mascotas[index];
        return Dismissible(
              key: Key(listPet[index].name),
              onDismissed: (DismissDirection direction) {
                petService.deletePet(mascota);
                setState(() {
                  listPet.removeAt(index);
                });
                // ignore: deprecated_member_use
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("mascota $mascota eliminada")));
              },
              secondaryBackground: Container(
                child: Center(
                  child: Text(
                    'Eliminar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                color: Colors.red,
              ),
              child: ListTile(
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
              ));
      },
    );
  }
}
