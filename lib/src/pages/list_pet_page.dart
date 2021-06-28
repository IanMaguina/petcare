import 'package:flutter/material.dart';
import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/models/pet.dart';
import 'package:petcare/src/services/pets_service.dart';

class ListPetPage extends StatelessWidget {
  void runFuture(Future list, APIResponse<List<Pet>> lists) {
    list.then((value) {
      lists = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final petprovider = new PetsService();
    APIResponse<List<Pet>> lists;
    List<Widget> petlist;
    Future list = petprovider.getPetByCustomerId("1");
    runFuture(list, lists);
    for (var i = 0; i < lists.data.length; i++) {
      petlist.add(
        pets(context, lists.data[i].name),
      );
    }
    return Scaffold(
      body: SafeArea(
        top: true,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: petlist,
        ),
      ),
    );
  }
}

Widget pets(BuildContext context, String name) {
  return Column(
    children: [
      ListTile(
        contentPadding: EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/pet1.jpg'),
          radius: 30,
        ),
        title: Text(name),
        subtitle: Text("2 años"),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Color.fromRGBO(57, 179, 179, 1),
        ),
        onTap: () {
          Navigator.pushNamed(context, 'petdetail');
        },
      ),
      Divider(),
    ],
  );
}
