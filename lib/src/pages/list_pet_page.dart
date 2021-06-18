import 'package:flutter/material.dart';

class ListPetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            pets(context, "perro 1"),
            pets(context, "perro 2"),
            pets(context, "perro 3"),
          ],
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
